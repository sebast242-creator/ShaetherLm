param(
    [ValidateSet('Install','Verify')][string]$Mode = 'Install',
    [string]$Destination
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Assert-Hash([string]$Path, [string]$Expected) {
    if (!(Test-Path -LiteralPath $Path -PathType Leaf) -or
        (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash -ne $Expected) {
        throw "Integrity check failed: $Path. Do not run this file."
    }
}

function Get-Package($Item, [string]$Path) {
    if (Test-Path -LiteralPath $Path) { Assert-Hash $Path $Item.sha256; return }
    $partial = "$Path.part"
    Write-Host "Downloading $($Item.name). Interrupted downloads can be resumed." -ForegroundColor Cyan
    & curl.exe --fail --location --retry 3 --connect-timeout 30 --proto '=https' --proto-redir '=https' --continue-at - --output $partial $Item.url
    if ($LASTEXITCODE -ne 0) { throw "Download interrupted. Run INSTALL again to resume. File: $partial" }
    Assert-Hash $partial $Item.sha256
    Move-Item -LiteralPath $partial -Destination $Path
}

function Expand-SafeZip([string]$Archive, [string]$Target) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    Add-Type -AssemblyName System.IO.Compression
    $prefix = [IO.Path]::GetFullPath($Target).TrimEnd('\') + '\'
    $zip = [IO.Compression.ZipFile]::OpenRead($Archive)
    try {
        foreach ($entry in $zip.Entries) {
            $name = $entry.FullName.Replace('/', '\')
            if ($name.Contains(':') -or [IO.Path]::IsPathRooted($name)) { throw 'Unsafe ZIP entry.' }
            $out = [IO.Path]::GetFullPath([IO.Path]::Combine($prefix, $name))
            if (!$out.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'ZIP path escapes its folder.' }
        }
    } finally { $zip.Dispose() }
    Expand-Archive -LiteralPath $Archive -DestinationPath $Target -Force
}

function Test-Engine([string]$Root, $Manifest) {
    $server = Join-Path $Root 'beellama\llama-server.exe'
    if (!(Test-Path -LiteralPath $server)) { throw "Engine missing: $server" }
    Assert-Hash (Join-Path $Root 'chat_template.jinja') $Manifest.template.sha256
    Write-Host 'Checking the model (13.5 GB); this can take a little time...'
    Assert-Hash (Join-Path $Root ('models\' + $Manifest.model.name)) $Manifest.model.sha256
    & $server --version
    if ($LASTEXITCODE -ne 0) { throw 'Engine cannot start. Check the NVIDIA driver and missing DLL messages.' }
    Write-Host 'Files and executable verified. Model loading and available VRAM must now be tested in ShaetherLm.' -ForegroundColor Green
}

function Install-Kit([string]$Root, $Manifest, [string]$LocalModel) {
    $Root = [IO.Path]::GetFullPath($Root)
    $marker = Join-Path $Root '.shaetherlm-kit.json'
    if (Test-Path -LiteralPath $Root) {
        if (!(Test-Path -LiteralPath $marker)) {
            if (@(Get-ChildItem -LiteralPath $Root -Force).Count) { throw 'Choose an empty folder. Existing installations are never replaced.' }
        } else {
            $old = Get-Content -LiteralPath $marker -Raw | ConvertFrom-Json
            if ($old.version -ne $Manifest.version -or $old.kit -ne 'ShaetherLm-BeeLlama') { throw 'This folder belongs to another kit version. Choose a new folder.' }
        }
    }
    New-Item -ItemType Directory -Force -Path $Root | Out-Null
    @{kit='ShaetherLm-BeeLlama';version=$Manifest.version} | ConvertTo-Json | Set-Content -LiteralPath $marker -Encoding UTF8
    $cache = Join-Path $Root '.downloads'
    New-Item -ItemType Directory -Force -Path $cache | Out-Null
    $engine = Join-Path $Root 'beellama'
    New-Item -ItemType Directory -Force -Path $engine | Out-Null
    foreach ($item in $Manifest.archives) {
        $archive = Join-Path $cache $item.name
        Get-Package $item $archive
        $unpack = Join-Path $cache ($item.name + '.unpacked')
        Expand-SafeZip $archive $unpack
        $servers = @(Get-ChildItem -LiteralPath $unpack -Recurse -Filter 'llama-server.exe')
        if ($item.kind -eq 'engine') {
            if ($servers.Count -ne 1) { throw 'Unexpected engine archive layout.' }
            $payload = $servers[0].Directory.FullName
        } else {
            $runtimes = @(Get-ChildItem -LiteralPath $unpack -Recurse -Filter 'cudart64_*.dll')
            if ($runtimes.Count -ne 1) { throw 'Unexpected CUDA archive layout.' }
            $payload = $runtimes[0].Directory.FullName
        }
        Get-ChildItem -LiteralPath $payload -Force | Copy-Item -Destination $engine -Recurse -Force
    }
    Get-Package $Manifest.template (Join-Path $Root 'chat_template.jinja')
    $models = Join-Path $Root 'models'
    New-Item -ItemType Directory -Force -Path $models | Out-Null
    $modelPath = Join-Path $models $Manifest.model.name
    if ($LocalModel -and !(Test-Path -LiteralPath $modelPath)) {
        Write-Host 'Checking your existing GGUF before copying it...'
        Assert-Hash $LocalModel $Manifest.model.sha256
        Copy-Item -LiteralPath $LocalModel -Destination "$modelPath.part"
        Assert-Hash "$modelPath.part" $Manifest.model.sha256
        Move-Item -LiteralPath "$modelPath.part" -Destination $modelPath
    } else { Get-Package $Manifest.model $modelPath }
    Test-Engine $Root $Manifest
    $instructions = @"
ShaetherLm > Settings > Connection: choose BeeLlama.
Settings > BeeLlama > BeeLlama folder: $Root
Context: start with 64K (65536); try 90K (92160) after a successful load.
MTP: OFF. Save & Apply.
ShaetherLm starts the engine itself on 127.0.0.1:11435.
No need to start a second server. No application configuration was changed.
"@
    $instructions | Set-Content -LiteralPath (Join-Path $Root 'CONNECT_TO_SHAETHERLM.txt') -Encoding UTF8
    Write-Host $instructions -ForegroundColor Green
}

if ($MyInvocation.InvocationName -ne '.') {
    try {
        $manifest = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'sources.json') -Raw | ConvertFrom-Json
        if (!$Destination) {
            $default = Join-Path $env:LOCALAPPDATA 'ShaetherLm\BeeLlama-0.4.9'
            Write-Host 'ShaetherLm BeeLlama kit - NVIDIA Windows x64' -ForegroundColor Cyan
            Write-Host "Installation folder / Dossier [$default]"
            $Destination = Read-Host
            if (!$Destination) { $Destination = $default }
        }
        $Destination = [Environment]::ExpandEnvironmentVariables($Destination.Trim().Trim('"'))
        if ($Mode -eq 'Verify') { Test-Engine $Destination $manifest; exit 0 }
        if (![Environment]::Is64BitOperatingSystem) { throw 'Windows x64 is required.' }
        if (!(Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw 'curl.exe is required (included with current Windows 10/11).' }
        $gpu = Get-Command nvidia-smi.exe -ErrorAction SilentlyContinue
        if (!$gpu) { throw 'NVIDIA driver not detected. Install the official NVIDIA driver first.' }
        & $gpu.Source --query-gpu=name,memory.total,driver_version --format=csv,noheader
        if ($LASTEXITCODE -ne 0) { throw 'NVIDIA driver check failed.' }
        Write-Host 'Profile: NVIDIA 16 GB, recent driver compatible with CUDA 13.3; 32 GB system RAM recommended.'
        Write-Host 'Download: about 14.6 GB. Allow 25 GB free disk space. No administrator access needed.'
        Write-Host '64K is a starting point, not a VRAM guarantee. Read README before installing.'
        Write-Host 'Official sources and their own licenses are listed in SOURCES.md.'
        $answer = Read-Host 'Download and install / Telecharger et installer ? [O/Y = yes; other = cancel]'
        if ($answer -notmatch '^(o|oui|y|yes)$') { exit 0 }
        $local = Read-Host 'Optional: path to the exact existing GGUF, or Enter to download / GGUF existant ou Entree'
        Install-Kit $Destination $manifest ($local.Trim().Trim('"'))
        exit 0
    } catch {
        Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host 'No existing ShaetherLm settings or other engine installation were changed.'
        exit 1
    }
}
