@echo off
cd /d "%~dp0"
set PROJECT=unlock
set OUTPUT=unlock.img
set ERRMSG=PreBuild.cmd
if exist PreBuild.cmd (
    echo Executing PreBuild.cmd...
    call PreBuild.cmd
)
if %ERRORLEVEL% NEQ 0 goto ERROR
set ERRMSG=nasm
echo Compiling %PROJECT%...
nasm -o %OUTPUT% %PROJECT%.asm
if %ERRORLEVEL% NEQ 0 goto ERROR
set ERRMSG=PostBuild.cmd
if exist PostBuild.cmd (
    echo Executing PostBuild.cmd...
    call PostBuild.cmd
)
if %ERRORLEVEL% NEQ 0 goto ERROR
echo Done.
pause
goto end

:ERROR
echo Error: fatal error: execute %ERRMSG% failed with error code: %ERRORLEVEL%
pause
goto end

:end
