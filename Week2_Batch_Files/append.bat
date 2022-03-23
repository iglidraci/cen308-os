@echo off
:: Here the contents of files given as the %2, %3 ... % n parameters
:: are appended into the file give as the %1 parameter.

set append_file=%1
:append
shift
if "%1" == "" goto end
type %1 >> %append_file%
goto append
:end
echo finished appending content to %append_file% 
pause