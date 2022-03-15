@echo off
:: shift command changes the position of batch parameters in a batch file.

:: copyFiles.bat copies any number of files
:: to a directory.
:: The command uses the following syntax:
:: copyFiles dir file1 file2 ...
set todir=%1
:copy
shift
if "%1"=="" goto end
:: copy command copies one or more files from one location to another
copy %1 %todir%
goto copy
:end
echo finished copying files to directory -^> %todir%
set todir=
echo All done