@ ECHO OFF
SET TG_EXE=Telegram.exe
:BEGINING
CLS
ECHO #---------------------------------#
ECHO #    TELEGRAM PROFILE SWITCHER    #
ECHO #---------------------------------#
ECHO # HERE ARE THE EXISTING PROFILES: #
ECHO -----------------------------------
DIR /A:D /B .
ECHO -----------------------------------
SET/P PROFILE=# TYPE A NAME: 
IF NOT EXIST %PROFILE% GOTO BEGINING
:CHECKRUNNING
TIMEOUT /T 2
CLS
FOR /F %%P IN ('tasklist /NH /FI "IMAGENAME eq %TG_EXE%"') DO IF %%P == %TG_EXE% GOTO RUNNING
ECHO #---------------------------------#
ECHO # REMOVING EXISTING LINK...       #
RMDIR /S /Q tdata
ECHO #---------------------------------#
ECHO # MAKING A NEW LINK TO PROFILE:   #
ECHO # -%PROFILE%-
MKLINK /J tdata .\%PROFILE%
ECHO #---------------------------------#
ECHO # STARTING Telegram.exe...        #
START Telegram.exe
ECHO #---------------------------------#
ECHO.
TIMEOUT /T 5
EXIT
:RUNNING
CLS
ECHO #---------------------------------#
ECHO # Telegram.exe IS RUNNING, CLOSE  #
ECHO # THE PROGRAM TO CONTINUE...      #
ECHO #---------------------------------#
TIMEOUT /T 2
GOTO CHECKRUNNING