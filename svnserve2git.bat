@echo off

:: set up some simple macros
set __NAME=[%~n0]:
set __LOG=%~n0.std.log
set __ERR=%~n0.err.log

:: delete log files
del /q %__LOG% 2>nul 
del /q %__ERR% 2>nul 

echo %__NAME% migrate svn repo to git via svnserve to avoid needing to match repo formats
setlocal

echo %__NAME% param check
:: check for required parameter
if NOT EXIST "%1" (echo %__NAME% input repo not present
  >>%__ERR% echo %__NAME% input repo [%1] not present
  exit /b 2
  )

echo %__NAME% start svn server
:: starts the svnserve process
> temp.bat echo start svnserve -d --root %CD%\%1
>> temp.bat echo if errorlevel 1 ( 
>> temp.bat echo   echo %__NAME% error starting svnserve %%errorlevel%% 
>> temp.bat echo   net helpmsg %%errorlevel%%
>> temp.bat echo   >>%__ERR% echo %__NAME% error starting svnserve %%errorlevel%% 
>> temp.bat echo   >>%__ERR% net helpmsg %%errorlevel%%
>> temp.bat echo   exit /b 1
>> temp.bat echo   )

call temp.bat

echo %__NAME% starting %DATE% %TIME%

>>%__LOG% echo %__NAME% starting git svn migration
1>>%__LOG% 2>>%__ERR% git svn clone svn://localhost

>>%__LOG% echo %__NAME% exiting with error %errorlevel% 

del temp.bat
endlocal

exit /b

