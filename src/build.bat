@echo off

REM parameters:
REM %1 debug or release
REM %2 $(RemoteHostName) 
REM %3 $(RemoteUserName)
REM %4 $(PrivateKey)
REM %5 $(SecureShellExecutable)
REM %6 $(RemoteWorkingDirectory)
REM %7 $(RemoteExecutable)
REM %8 $(RemoteExecutableArguments)

SET CONFIG=%1
SET REMOTE_HOST=%2
SET REMOTE_USER=%3
SET KEY=%~4
SET SSH=%~5
SET REMOTE_DIR=%~6
SET REMOTE_EXE=%~7
SET REMOTE_ARGS=%~8

set SSH=%~dp0..\external\rsync\ssh.exe
set KEY=%KEY%.id

echo CONFIG %CONFIG%
echo REMOTE_HOST %REMOTE_HOST%
echo REMOTE_USER %REMOTE_USER%
echo KEY %KEY%
echo SSH %SSH%
echo REMOTE_DIR %REMOTE_DIR%
echo REMOTE_EXE %REMOTE_EXE%
echo REMOTE_ARGS %REMOTE_ARGS%

REM set "KEY=%KEY:\=/%"
REM echo %KEY%


pushd %~dp0

set RSYNCPATH=..\external\rsync
pushd %RSYNCPATH%
set RSYNCPATH=%CD%
popd

set PATH=%RSYNCPATH%;%PATH%

pushd ..

echo rsync -avz --del --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r -e "ssh -i %KEY%" src %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_DIR%/ 
rsync -avz --del --chmod=Du=rwx,Dg=rx,Do=rx,Fu=rw,Fg=r,Fo=r -e "ssh -i %KEY%" src %REMOTE_USER%@%REMOTE_HOST%:%REMOTE_DIR%/ 

echo "%SSH%" -i "%KEY%" %REMOTE_USER%@%REMOTE_HOST% "cd %REMOTE_DIR% && mkdir -p out && cd out && cmake -DCMAKE_BUILD_TYPE=%CONFIG% ../src && make && ./%REMOTE_EXE% %REMOTE_ARGS%"
"%SSH%" -i "%KEY%" %REMOTE_USER%@%REMOTE_HOST% "cd %REMOTE_DIR% && mkdir -p out && cd out && cmake -DCMAKE_BUILD_TYPE=%CONFIG% ../src && make && %REMOTE_EXE% %REMOTE_ARGS%"

@echo off
popd
popd