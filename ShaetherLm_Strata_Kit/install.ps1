param(
    [ValidateSet('Install', 'Verify')][string]$Mode = 'Install',
    [string]$Destination,
    [ValidateRange(1024, 65535)][int]$Port = 8080
)

$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$release = 'https://github.com/Niko1221/Strata/releases/download/v0.2.13'
$installerHash = '322AD52BDDC137893B6091F4E8FF989CD87BA968E063E5B08E43E167480343FC'

function Test-Kit([string]$Folder) {
    $profile = Join-Path $Folder 'shaetherlm-gyro-s.json'
    foreach ($relative in @('terminal\current\python\python.exe', 'terminal\current\strata.py', 'shaetherlm-gyro-s.json')) {
        if (!(Test-Path -LiteralPath (Join-Path $Folder $relative) -PathType Leaf)) {
            throw "Missing $relative. Run INSTALL.cmd to finish setup."
        }
    }
    $config = Get-Content -LiteralPath $profile -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($config.host -ne '127.0.0.1' -or $config.api_key -or
        $config.model_name -notmatch 'gyro-s' -or !$config.exe -or
        !(Test-Path -LiteralPath $config.exe -PathType Leaf) -or !$config.args -or
        $config.fit_max_tokens -ne $false) {
        throw 'The Strata configuration is incomplete or is not the local Gyro-S profile.'
    }
    foreach ($flag in @('--pack', '--native')) {
        $index = [Array]::IndexOf([object[]]$config.args, $flag)
        if ($index -lt 0 -or $index + 1 -ge $config.args.Count -or
            !(Test-Path -LiteralPath $config.args[$index + 1])) {
            throw "The Gyro-S files for $flag are missing."
        }
    }
    Write-Host "Strata folder: $Folder"
    Write-Host 'In ShaetherLm V1.1 open Settings > Connection, select Strata, choose this folder, then click Start Strata.'
}

try {
    if (!$Destination) {
        $Destination = Read-Host 'Strata folder (choose a local SSD; enter its full path)'
    }
    if ($Destination -notmatch '^[A-Za-z]:[\\/]') { throw 'Enter a full local path, for example D:\ShaetherLm-Strata.' }
    $Destination = [IO.Path]::GetFullPath($Destination.Trim()).TrimEnd('\')
    if ($Destination -match '^[A-Za-z]:$') { throw 'Choose a subfolder of the drive.' }
    $profile = Join-Path $Destination 'shaetherlm-gyro-s.json'
    if ($Mode -eq 'Verify') { Test-Kit $Destination; exit 0 }
    if (Test-Path -LiteralPath $profile) { Test-Kit $Destination; exit 0 }
    if (Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue) {
        throw "Port $Port is already in use. Stop the other Strata session or choose another port with -Port."
    }

    $null = New-Item -Path $Destination -ItemType Directory -Force
    $drive = [IO.DriveInfo]::new([IO.Path]::GetPathRoot($Destination))
    if ($drive.AvailableFreeSpace -lt 80GB -and !(Test-Path -LiteralPath (Join-Path $Destination 'models'))) {
        throw 'Choose a drive with at least 80 GiB free for a fresh Gyro-S setup.'
    }
    $env:STRATA_DATA_DIR = $Destination
    $env:STRATA_FEED = $release
    $env:STRATA_COMPONENTS_DIR = Join-Path $Destination 'components'
    Remove-Item Env:STRATA_INSTALL_TEST_TRUST -ErrorAction SilentlyContinue
    $terminal = Join-Path $Destination 'terminal\current\bin\strata.cmd'
    if (!(Test-Path -LiteralPath $terminal -PathType Leaf)) {
        $bootstrap = Join-Path $Destination 'strata-install-0.2.13.ps1'
        Invoke-WebRequest -UseBasicParsing -Uri "$release/install.ps1" -OutFile $bootstrap
        if ((Get-FileHash -LiteralPath $bootstrap -Algorithm SHA256).Hash -ne $installerHash) {
            throw 'The official installer checksum did not match.'
        }
        & powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File $bootstrap
        if ($LASTEXITCODE -ne 0 -or !(Test-Path -LiteralPath $terminal -PathType Leaf)) {
            throw 'Strata Terminal installation did not complete.'
        }
    }

    # A dedicated preset lets us look up the generated profile and stop only the setup instance.
    $hash = [Security.Cryptography.SHA256]::Create()
    try {
        $pathBytes = [Text.Encoding]::UTF8.GetBytes($Destination.ToLowerInvariant())
        $suffix = ([BitConverter]::ToString($hash.ComputeHash($pathBytes))).Replace('-', '').Substring(0, 12).ToLowerInvariant()
    } finally { $hash.Dispose() }
    $name = "shaetherlm-kit-$suffix"
    $launchProfile = "launch-$name"
    $priorJson = & $terminal runtime status --profile $launchProfile --output json
    if ($LASTEXITCODE -ne 0) { throw 'Unable to inspect the setup profile.' }
    $prior = ($priorJson | Out-String) | ConvertFrom-Json
    if ($prior.state -in @('ready', 'starting')) {
        throw "A previous setup instance is still running. Use Strata to stop $launchProfile before retrying."
    }
    $arguments = @('launch', '--family', 'gyro', '--model', 'Gyro-S', '--data-dir', $Destination,
        '--context', '100k', '--vision', 'off', '--drafting', 'auto', '--access', 'local',
        '--port', "$Port", '--set', 'STRATA_RAM_KEEP_GIB=3', '--set', 'vram-reserve-mib=300',
        '--set', 'resident-budget-gib=16', '--save-preset', $name, '--no-tui', '--yes',
        '--feed', "$release/strata-feed.json", '--output', 'json')
    Write-Host 'Downloading and preparing Gyro-S. First setup can take a while.'
    $launchJson = & $terminal @arguments
    if ($LASTEXITCODE -ne 0) {
        $launchJson | Out-Host
        throw 'Strata setup failed. See the details above, then run INSTALL.cmd again.'
    }
    $launchResult = ($launchJson | Out-String) | ConvertFrom-Json
    if (!$launchResult.ok -or $launchResult.profile -ne $launchProfile -or
        $launchResult.serving -eq $false -or $launchResult.reused) {
        $launchResult | ConvertTo-Json -Depth 10 | Out-Host
        throw 'Strata did not start a new setup instance. See the setup output above.'
    }

    $runningJson = & $terminal runtime status --profile $launchProfile --output json
    if ($LASTEXITCODE -ne 0) { throw 'Unable to verify the Strata setup instance.' }
    $running = ($runningJson | Out-String) | ConvertFrom-Json
    if ($running.state -ne 'ready' -or !$running.owner_id -or !$running.instance_id) {
        throw 'Gyro-S did not reach the ready state. See the Strata setup output above.'
    }
    try {
        $source = Join-Path $env:LOCALAPPDATA "Strata\launch\$name.json"
        $config = Get-Content -LiteralPath $source -Raw -Encoding UTF8 | ConvertFrom-Json
        if ($config.host -ne '127.0.0.1' -or $config.api_key -or $config.port -ne $Port -or
            $config.model_name -notmatch 'gyro-s' -or !$config.exe -or
            !(Test-Path -LiteralPath $config.exe -PathType Leaf) -or !$config.args) {
            throw 'The setup did not produce the expected local Gyro-S configuration.'
        }
        $config | Add-Member -NotePropertyName fit_max_tokens -NotePropertyValue $false -Force
        $config | Add-Member -NotePropertyName log -NotePropertyValue (Join-Path $Destination 'shaetherlm-gyro-s.engine.log') -Force
    } finally {
        $stopJson = & $terminal runtime stop --profile $launchProfile --if-owner-id $running.owner_id --if-instance-id $running.instance_id --output json
        if ($LASTEXITCODE -ne 0) { throw "Could not stop the setup instance $launchProfile. See Strata output above." }
        $stopped = ($stopJson | Out-String) | ConvertFrom-Json
        if (!$stopped.ok) { throw "Could not stop the setup instance $launchProfile." }
    }
    $staged = "$profile.part"
    [IO.File]::WriteAllText($staged, ($config | ConvertTo-Json -Depth 60), [Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $staged -Destination $profile
    Test-Kit $Destination
} catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}
