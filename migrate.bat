@echo example driver script
@echo off
setlocal

:: set up a simple macro
set __OUTPUT=echo [%~n0]: 

:: check for required parameter
if NOT EXIST source %__OUTPUT% import repo not defined & exit /b 2

start svnserve -d --root %CD%\source

%__OUTPUT% starting %DATE% %TIME%

:: delete log file
del /q %~n0.log 2>nul 

>%~n0.log git svn clone svn://localhost

%__OUTPUT% exiting with error %errorlevel% 
endlocal

