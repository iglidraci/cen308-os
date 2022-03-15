@echo off
:start
:: cls clears the command prompt window
cls
echo enter the flash disk with files you wish to delete.
pause
:: del command deletes one or more files
:: del /p 	prompts for confirmation before deleting the specified file
:: del /q you are not prompted for delete confirmation
del /q c:\delete\*.*
echo Press Ctrl + C to stop executing this batch file.
echo otherwise press any key to continue deleting files
pause
goto start