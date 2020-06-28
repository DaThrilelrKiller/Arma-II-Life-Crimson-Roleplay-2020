
:: Crimson Roleplay Auto-Update
:: By: Tucker H
:: Created - 4/27/2020

@echo off
title Crimson RP - Auto Restart
SETLOCAL ENABLEEXTENSIONS
set EXE=arma2oaserver.exe
set /a Timeout = 14400
set /a i = 0

::Grabs current dir
for %%I in ("%cd%\..") do set "dir=%%~fI"

:v64_path_a2
For /F "Tokens=2* skip=2" %%A In ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') Do (set _ARMA2=%%B)

IF NOT DEFINED _ARMA2 (GOTO v32_path_a2) ELSE (GOTO v64_path_a2oa)

:v32_path_a2
For /F "Tokens=2* skip=2" %%C In ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') Do (set _ARMA2=%%D)

IF NOT DEFINED _ARMA2 (GOTO uac_PATH_A2) ELSE (GOTO v64_path_a2oa)

:uac_PATH_A2
@FOR /F "tokens=2* delims=	 " %%I IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') DO (SET _ARMA2=%%J)

IF NOT DEFINED _ARMA2 (GOTO std_PATH_A2) ELSE (GOTO v64_path_a2oa)

:std_PATH_A2
@FOR /F "tokens=2* delims=	 " %%K IN ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2" /v "MAIN"') DO (SET _ARMA2=%%L)

IF NOT DEFINED _ARMA2 (GOTO ENDfailA2) ELSE (GOTO v64_path_a2oa)


:v64_path_a2oa
For /F "Tokens=2* skip=2" %%E In ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') Do (set _ARMA2OAPATH=%%F)

IF NOT DEFINED _ARMA2OAPATH (GOTO v32_path_a2oa) ELSE (GOTO update)

:v32_path_a2oa
For /F "Tokens=2* skip=2" %%G In ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') Do set (_ARMA2OAPATH=%%H)

IF NOT DEFINED _ARMA2OAPATH (GOTO uac_PATH_A2OA) ELSE (GOTO update)

:uac_PATH_A2OA
@FOR /F "tokens=2* delims=	 " %%M IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') DO (SET _ARMA2OAPATH=%%N)

IF NOT DEFINED _ARMA2OAPATH (GOTO std_PATH_A2OA) ELSE (GOTO update)

:std_PATH_A2OA
@FOR /F "tokens=2* delims=	 " %%O IN ('REG QUERY "HKLM\SOFTWARE\Bohemia Interactive Studio\ArmA 2 OA" /v "MAIN"') DO (SET _ARMA2OAPATH=%%P)

IF NOT DEFINED _ARMA2OAPATH (GOTO ENDfailA2OA) ELSE (GOTO update)

:update


::Copy server configuation file to Arma 2 OA Directory
xcopy /s/e /y /I "%userprofile%\Documents\CrimsonRP\tadst" "%_ARMA2OAPATH%\tadst"

::Copyies Server side mods over
xcopy /s/e /y /I "%userprofile%\Documents\CrimsonRP\@inidbi" "%_ARMA2OAPATH%\@inidbi"


::Copy mission file to MPmissions
xcopy /y "%userprofile%\Documents\CrimsonRP\CRP_Client.cmr_cicada.pbo" "%_ARMA2OAPATH%\MPmissions"

::Copy server files to MP missions
xcopy /s/e /y /I "%userprofile%\Documents\CrimsonRP\CRP_Server" "%_ARMA2OAPATH%\MPmissions"

goto start

:start

timeout /t 5

start "" "%_ARMA2OAPATH%\arma2oaserver.exe" "-mod=%_ARMA2%;EXPANSION;ca;@CRP;%_ARMA2OAPATH%\@inidbi;"  -port=2302 "-config=%_ARMA2OAPATH%\TADST\default\TADST_config.cfg" "-cfg=%_ARMA2OAPATH%\TADST\default\TADST_basic.cfg" "-profiles=%_ARMA2OAPATH%\TADST\default" -name=default

timeout /t 20

cd "%_ARMA2OAPATH%\TADST\default\Bec"
start /min Bec.exe -f "Config.cfg"


timeout /t 120

goto time_start


:time_start 
:: Capture Hour
set hour=%time:~0,2%
:: Remove leading space if single digit
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%

:: Minutes
set min=%time:~3,2%
:: Remove leading space
if "%min:~0,1%" == " " set min=0%min:~1,1%

:: Seconds
set secs=%time:~6,2%
:: Remove leading space
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%

:: Year
set year=%date:~-4%

:: Month
set month=%date:~3,2%
:: Remove leading space if single digit
if "%month:~0,1%" == " " set month=0%month:~1,1%

:: Day
set day=%date:~0,2%
:: Remove leading space
if "%day:~0,1%" == " " set day=0%day:~1,1%

:: Reformatted date
set CurTime= %hour%%min%
cls
echo %CurTime%
timeout /t 5

IF %CurTime% EQU 0400 (GOTO kill) 
IF %CurTime% EQU 0800 (GOTO kill) 
IF %CurTime% EQU 1200 (GOTO kill)
IF %CurTime% EQU 1600 (GOTO kill) 
IF %CurTime% EQU 2000 (GOTO kill) 
IF %CurTime% EQU 2400 (GOTO kill)

tasklist /fi "imagename eq arma2oaserver.exe" 2>NUL | find /I /N "no tasks are running">NUL
if "%errorlevel%"=="0" (
    goto kill
) else (
    goto time_start
)

:kill
set /a i = 0
taskkill /f /im bec.exe
taskkill /f /im %EXE%
timeout /t 15
goto update
