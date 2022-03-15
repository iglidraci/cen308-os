@echo off
:: if command performs conditional processing in batch programs
:: if [not] ERRORLEVEL <number> <command> [else <expression>]
:: if [not] <string1>==<string2> <command> [else <expression>]
:: if [not] exist <filename> <command> [else <expression>]

if not exist reboot.bat (echo Cannot reboot) else (echo Rebook successfully)

del reboot.bat
if not errorlevel 1 goto end
echo Error occured during reboot.bat deletion
:end
echo End of batch program.
if %errorlevel% LEQ 1 echo Error level less then or equal to 1
pause