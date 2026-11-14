@echo off
setlocal
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" -Mode Verify %*
set "KIT_RESULT=%ERRORLEVEL%"
echo.
pause
exit /b %KIT_RESULT%
