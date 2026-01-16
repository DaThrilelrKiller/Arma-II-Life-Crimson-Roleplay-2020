@echo off
:: Crimson Roleplay Build Script
:: Consolidates .fnc and .variables files into functions.sqf and variables.sqf
:: Builds mission in %userprofile%\Documents\RLRPG\


title Crimson Roleplay - Build Script
SETLOCAL ENABLEEXTENSIONS

cd Arma-II-Life-Crimson-Roleplay-2020
git pull


:: Get the script directory and navigate to project root
cd /d "%~dp0\.."

set "PROJECT_ROOT=%CD%"
set "FUNCTIONS_DIR=%PROJECT_ROOT%\CRP_Client.cmr_cicada\functions"
set "OUTPUT_DIR=%PROJECT_ROOT%\CRP_Client.cmr_cicada"
set "BUILD_DIR=%userprofile%\Documents\RLRPG"
set "BUILD_OUTPUT_DIR=%BUILD_DIR%\CRP_Client.cmr_cicada"
set "FUNCTIONS_SQF=%BUILD_OUTPUT_DIR%\functions.sqf"
set "VARIABLES_SQF=%BUILD_OUTPUT_DIR%\variables.sqf"

echo [BUILD] Starting build process...
echo [BUILD] Project root: %PROJECT_ROOT%
echo [BUILD] Functions directory: %FUNCTIONS_DIR%
echo [BUILD] Build output directory: %BUILD_OUTPUT_DIR%

:: Check if functions directory exists
if not exist "%FUNCTIONS_DIR%" (
    echo [ERROR] Functions directory not found: %FUNCTIONS_DIR%
    pause
    exit /b 1
)

:: Create build directories first
echo [BUILD] Creating build directories...
if not exist "%BUILD_DIR%" (
    mkdir "%BUILD_DIR%"
    echo [BUILD] Created: %BUILD_DIR%
)
if not exist "%BUILD_OUTPUT_DIR%" (
    mkdir "%BUILD_OUTPUT_DIR%"
    echo [BUILD] Created: %BUILD_OUTPUT_DIR%
)

:: Create a temporary PowerShell script file
set "PS_SCRIPT=%TEMP%\build_script.ps1"
echo Creating PowerShell script at: %PS_SCRIPT%

(
echo $ErrorActionPreference = 'Continue'
echo $functionsDir = '%FUNCTIONS_DIR%'
echo $functionsSqf = '%FUNCTIONS_SQF%'
echo $variablesSqf = '%VARIABLES_SQF%'
echo.
echo Write-Host '[BUILD] Functions dir: ' $functionsDir
echo Write-Host '[BUILD] Output files: ' $functionsSqf ' and ' $variablesSqf
echo.
echo # Remove existing output files
echo if ^(Test-Path $functionsSqf^) { Remove-Item $functionsSqf -Force; Write-Host '[BUILD] Removed existing functions.sqf' }
echo if ^(Test-Path $variablesSqf^) { Remove-Item $variablesSqf -Force; Write-Host '[BUILD] Removed existing variables.sqf' }
echo.
echo # Create empty files
echo New-Item -Path $functionsSqf -ItemType File -Force ^| Out-Null
echo New-Item -Path $variablesSqf -ItemType File -Force ^| Out-Null
echo Write-Host '[BUILD] Created empty output files'
echo.
echo $dtkInit = @^(^)
echo $dtkJip = @^(^)
echo $dtkFired = @^(^)
echo $dtkRespawn = @^(^)
echo $processedFiles = @^(^)
echo.
echo # Read module order from config
echo $modulesCfg = '%PROJECT_ROOT%\CRP_Server\modules.cfg'
echo $moduleOrder = Get-Content -Path $modulesCfg ^| Where-Object { $_.Trim^(^) -ne '' }
echo Write-Host '[BUILD] Loaded ' $moduleOrder.Count ' modules from config'
echo.
echo # Get all .fnc files excluding disabled folder
echo $allFncFiles = Get-ChildItem -Path $functionsDir -Filter '*.fnc' -Recurse ^| Where-Object { $_.FullName -notmatch '\\disabled\\' }
echo Write-Host '[BUILD] Found ' $allFncFiles.Count ' .fnc files ^(excluding disabled folder^)'
echo.
echo # Process files in module order ^(especially for init functions^)
echo foreach ^($module in $moduleOrder^) {
echo     $moduleName = $module.Trim^(^)
echo     Write-Host "[BUILD] Processing module: $moduleName"
echo.
echo     # Find files for this module - match by folder name
echo     $moduleFiles = $allFncFiles ^| Where-Object {
echo         $filePath = $_.FullName -replace [regex]::Escape^($functionsDir^), ''
echo         $dirPath = Split-Path $filePath
echo         $lastFolder = Split-Path $dirPath -Leaf
echo         # Match if last folder name equals module name ^(e.g., Core\Network = Network, Police\ID = ID^)
echo         ^($lastFolder -eq $moduleName^) -and $processedFiles -notcontains $_.FullName
echo     }
echo.
echo     # Process each file in this module
echo     $moduleFiles ^| ForEach-Object {
echo         $fncFile = $_.FullName
echo         $funcName = $_.BaseName
echo         $content = Get-Content -Path $fncFile -Raw
echo.
echo         # Add function definition
echo         Add-Content -Path $functionsSqf -Value "$funcName = {`r`n$content`r`n};`r`n"
echo         $processedFiles += $fncFile
echo.
echo         # Check event types ^(exclude setup_* functions from all DTK_Events arrays^)
echo         if ^($funcName -match '_init$' -and $funcName -ne 'setup_init'^) { $dtkInit += $funcName }
echo         elseif ^($funcName -match '_jip$' -and $funcName -ne 'setup_jip'^) { $dtkJip += $funcName }
echo         elseif ^($funcName -match '_fired$' -and $funcName -ne 'setup_fired'^) { $dtkFired += $funcName }
echo         elseif ^($funcName -match '_respawn$' -and $funcName -ne 'setup_respawn'^) { $dtkRespawn += $funcName }
echo     }
echo }
echo.
echo # Process any remaining files not matched to modules
echo $remainingFiles = $allFncFiles ^| Where-Object { $processedFiles -notcontains $_.FullName }
echo if ^($remainingFiles.Count -gt 0^) {
echo     Write-Host '[BUILD] Processing ' $remainingFiles.Count ' remaining files not in module config'
echo     $remainingFiles ^| ForEach-Object {
echo         $fncFile = $_.FullName
echo         $funcName = $_.BaseName
echo         $content = Get-Content -Path $fncFile -Raw
echo.
echo         # Add function definition
echo         Add-Content -Path $functionsSqf -Value "$funcName = {`r`n$content`r`n};`r`n"
echo.
echo         # Check event types ^(exclude setup_* functions from all DTK_Events arrays^)
echo         if ^($funcName -match '_init$' -and $funcName -ne 'setup_init'^) { $dtkInit += $funcName }
echo         elseif ^($funcName -match '_jip$' -and $funcName -ne 'setup_jip'^) { $dtkJip += $funcName }
echo         elseif ^($funcName -match '_fired$' -and $funcName -ne 'setup_fired'^) { $dtkFired += $funcName }
echo         elseif ^($funcName -match '_respawn$' -and $funcName -ne 'setup_respawn'^) { $dtkRespawn += $funcName }
echo     }
echo }
echo.
echo Write-Host '[BUILD] Processed ' $processedFiles.Count ' .fnc files in module order'
echo.
echo # Process .variables files
echo Write-Host '[BUILD] Processing .variables files...'
echo $varFiles = Get-ChildItem -Path $functionsDir -Filter '_module.variables' -Recurse ^| Where-Object { $_.FullName -notmatch '\\disabled\\' }
echo Write-Host '[BUILD] Found ' $varFiles.Count ' .variables files ^(excluding disabled folder^)'
echo $varFiles ^| ForEach-Object {
echo     $varFile = $_.FullName
echo     $content = Get-Content -Path $varFile -Raw
echo     Add-Content -Path $variablesSqf -Value "$content`r`n"
echo }
echo Write-Host '[BUILD] Processed ' $varFiles.Count ' .variables files'
echo.
echo # Generate DTK_Events arrays
echo Write-Host '[BUILD] Generating DTK_Events arrays...'
echo $initList = if ^($dtkInit.Count -gt 0^) { $dtkInit -join ', ' } else { '' }
echo $jipList = if ^($dtkJip.Count -gt 0^) { $dtkJip -join ', ' } else { '' }
echo $firedList = if ^($dtkFired.Count -gt 0^) { $dtkFired -join ', ' } else { '' }
echo $respawnList = if ^($dtkRespawn.Count -gt 0^) { $dtkRespawn -join ', ' } else { '' }
echo.
echo Add-Content -Path $functionsSqf -Value "DTK_INIT = [$initList];`r`n"
echo Add-Content -Path $functionsSqf -Value "DTK_jip = [$jipList];`r`n"
echo Add-Content -Path $functionsSqf -Value "DTK_fired = [$firedList];`r`n"
echo Add-Content -Path $functionsSqf -Value "DTK_respawn = [$respawnList];`r`n"
echo.
echo Write-Host '[BUILD] PowerShell script completed successfully'
echo Write-Host '[BUILD] DTK_INIT: ' $dtkInit.Count ' functions'
echo Write-Host '[BUILD] DTK_jip: ' $dtkJip.Count ' functions'
echo Write-Host '[BUILD] DTK_fired: ' $dtkFired.Count ' functions'
echo Write-Host '[BUILD] DTK_respawn: ' $dtkRespawn.Count ' functions'
) > "%PS_SCRIPT%"

echo [BUILD] Running PowerShell script...
powershell -ExecutionPolicy Bypass -NoProfile -File "%PS_SCRIPT%"

if errorlevel 1 (
    echo [ERROR] PowerShell script failed with error code %errorlevel%
    echo [DEBUG] Check the script at: %PS_SCRIPT%
    pause
    exit /b 1
)

echo [BUILD] PowerShell script completed successfully

:: Clean up temp script
if exist "%PS_SCRIPT%" del /q "%PS_SCRIPT%"

echo [BUILD] Copying project to build directory...

:: Copy everything from PROJECT_ROOT to BUILD_DIR
xcopy /s /e /y /I "%PROJECT_ROOT%\*" "%BUILD_DIR%"

echo [BUILD] Removing functions folder from build...

:: Remove functions folder from copied mission
if exist "%BUILD_DIR%\CRP_Client.cmr_cicada\functions" (
    rd /s /q "%BUILD_DIR%\CRP_Client.cmr_cicada\functions"
    echo [BUILD] Functions folder removed from build
)

echo [BUILD] Processing files with FART...

:: Change to install directory to use fart.exe
cd /d "%~dp0"

:: Remove tabs from files
::FART -r --c-style "%BUILD_DIR%\*.sqf" "\t" " "
::FART -r --c-style "%BUILD_DIR%\*.sqm" "\t" " "
::FART -r --c-style "%BUILD_DIR%\*.hpp" "\t" " "

:: Remove \r\n from files
::FART -r --c-style "%BUILD_DIR%\*.sqf" "\r\n" " "
::FART -r --c-style "%BUILD_DIR%\*.sqm" "\r\n" " "
::FART -r --c-style "%BUILD_DIR%\*.hpp" "\r\n" " "

:: Remove \n from files
::FART -r --c-style "%BUILD_DIR%\*.sqf" "\n" " "
::FART -r --c-style "%BUILD_DIR%\*.sqm" "\n" " "
::FART -r --c-style "%BUILD_DIR%\*.hpp" "\n" " "

echo [BUILD] Files processed with FART

echo [BUILD] Building PBO file...

:: Change to install directory to use cpbo.exe
cd /d "%~dp0"

:: Build PBO file
cpbo -p "%BUILD_DIR%\CRP_Client.cmr_cicada" "%BUILD_DIR%\CRP_Client.cmr_cicada.pbo"

if errorlevel 1 (
    echo [ERROR] PBO build failed with error code %errorlevel%
) else (
    echo [BUILD] PBO file created successfully: %BUILD_DIR%\CRP_Client.cmr_cicada.pbo
)

:: Return to project root
cd /d "%PROJECT_ROOT%"

echo [BUILD] Build complete!
echo [BUILD] Project copied to: %BUILD_DIR%
echo [BUILD] Mission built at: %BUILD_DIR%\CRP_Client.cmr_cicada
echo [BUILD] PBO file: %BUILD_DIR%\CRP_Client.cmr_cicada.pbo
echo [BUILD] Functions consolidated: %FUNCTIONS_SQF%
echo [BUILD] Variables consolidated: %VARIABLES_SQF%

:: Verify files exist
if exist "%FUNCTIONS_SQF%" (
    echo [BUILD] VERIFIED: functions.sqf exists
) else (
    echo [ERROR] functions.sqf was NOT created!
)

if exist "%VARIABLES_SQF%" (
    echo [BUILD] VERIFIED: variables.sqf exists
) else (
    echo [ERROR] variables.sqf was NOT created!
)

if exist "%BUILD_DIR%\CRP_Client.cmr_cicada.pbo" (
    echo [BUILD] VERIFIED: CRP_Client.cmr_cicada.pbo exists
) else (
    echo [ERROR] CRP_Client.cmr_cicada.pbo was NOT created!
)

ENDLOCAL
pause
