@echo off
:: goto Directs cmd.exe to a labeled line in a batch program
:: syntax goto <label>
:: goto::EOF transfers control to the end of the current batch script file and exit the batch script

:: The label within the batch program must begin with a colon (:)
:: if it doesn't contain the label, Label not found

echo Formatting disk ...
echo.
goto success
echo Formatting failed ...
:success
echo Formatting successfully completed
goto end
:end
echo End of batch file
pause
