@echo off
REM Toolworks, served over your own machine so a phone on the same Wi-Fi can open it,
REM and so Edge can install it as an app. Needs nothing installed: Windows ships
REM PowerShell 5.1, and this uses it.
setlocal
set PORT=8731
echo.
echo   Toolworks is starting on http://localhost:%PORT%/
echo   On this PC:      http://localhost:%PORT%/
echo   From a phone:    http://YOUR-PC-IP:%PORT%/   (same Wi-Fi)
echo.
echo   Press Ctrl+C to stop.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1" -Port %PORT% -Root "%~dp0."
if errorlevel 1 (
  echo.
  echo   PowerShell could not start the server. The page still works: double-click Toolworks.cmd
  pause
)
