@echo off
echo Updating mission.template from mission.biedi...
cd /d "%~dp0\.."
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0update_map.ps1"
if errorlevel 1 (
    echo.
    echo ERROR: Failed to update mission.template
    pause
    exit /b 1
)
echo.
pause
