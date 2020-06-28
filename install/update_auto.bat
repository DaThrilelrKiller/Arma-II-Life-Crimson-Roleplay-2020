
:: Crimson Roleplay Auto-Update
:: By: Tucker H
:: Created - 4/27/2020

@echo off
title Crimson Roleplay - Auto Update
SETLOCAL ENABLEEXTENSIONS

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
set CurTime= %month%/%day%/%year% at %hour%:%min%

::Set name for updated mission file
set missionversion=%date:~10,4%%date:~7,2%%date:~4,2%

::Grabs directory to copy files from
for %%I in ("%cd%\..") do set "dir=%%~fI"

::Copys files to temp fold to be compiled
xcopy /s/e /y /I %dir% "%userprofile%\Documents\CrimsonRP"

::change working directory to allow us to compile mission without getting stoped by dropbox
chdir /d %userprofile%\Documents\CrimsonRP\install

::Compiles all code in mission on to one line, removes tab, and new line chars
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.fnc" "\t" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqf" "\t" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqm" "\t" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.hpp" "\t" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.functions" "\t" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.variables" "\t" " "

FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.fnc" "\r\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqf" "\r\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqm" "\r\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.hpp" "\r\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.functions" "\r\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.variables" "\r\n" " "

FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.fnc" "\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqf" "\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.sqm" "\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.hpp" "\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.functions" "\n" " "
FART -r --c-style "%userprofile%\Documents\CrimsonRP\*.variables" "\n" " "

FART -r --c-style "%userprofile%\Documents\CrimsonRP\tadst\default\TADST_config.cfg" "Mission_date_time" "%CurTime%"

::Compiles mission into a pbo with a custom version #
cpbo -p %userprofile%\Documents\CrimsonRP\CRP_Client.cmr_cicada %userprofile%\Documents\CrimsonRP\CRP_Client.cmr_cicada.pbo

