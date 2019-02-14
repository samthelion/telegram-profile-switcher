@ ECHO OFF
CD %~dp0
SET TG_EXE=Telegram.exe
:BEGINING
CLS
ECHO #---------------------------------#
ECHO #    TELEGRAM PROFILE SWITCHER    #
ECHO #---------------------------------#
ECHO # HERE ARE THE EXISTING PROFILES: #
ECHO -----------------------------------
DIR /A:D /B . | FIND /V "tdata" | FIND /V "updater"
ECHO -----------------------------------
SET/P PROFILE=# TYPE A NAME: 
IF NOT EXIST %PROFILE% GOTO BEGINING
:CHECKRUNNING
CLS
ECHO #---------------------------------#
ECHO # - CHECKING IF %TG_EXE% IS   #
ECHO #   RUNNING...                    #
ECHO #---------------------------------#
FOR /F %%P IN ('tasklist /NH /FI "IMAGENAME eq %TG_EXE%"') DO IF %%P == %TG_EXE% GOTO RUNNING
ECHO #   [%TG_EXE% ISN'T RUNNING]  #
ECHO # - REMOVING EXISTING LINK...     #
RMDIR /S /Q tdata
ECHO #---------------------------------#
ECHO # - MAKING A NEW LINK TO PROFILE: #
ECHO #   [%PROFILE%]
MKLINK /J tdata .\%PROFILE% >NUL
ECHO #---------------------------------#
ECHO # - STARTING %TG_EXE%...      #
START %TG_EXE%
ECHO #---------------------------------#
ECHO.
TIMEOUT /T 5 >NUL
EXIT
:RUNNING
CLS
ECHO #---------------------------------#
ECHO # %TG_EXE% IS RUNNING, CLOSE  #
ECHO # THE PROGRAM TO CONTINUE...      #
ECHO #---------------------------------#
TIMEOUT /T 3 /NOBREAK >NUL
GOTO CHECKRUNNING