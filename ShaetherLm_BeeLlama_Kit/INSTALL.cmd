@echo off
setlocal
cd /d "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" -Mode Install
set "KIT_RESULT=%ERRORLEVEL%"
echo.
pause
exit /b %KIT_RESULT%
