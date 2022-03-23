@echo off
:: type is a built in command which displays the contents of a text file.
:: Use the type command to view a text file without modifying it

echo content of file: %1%
type %1%
echo.
pause
echo content of file: %2%
type %2%
echo.
pause
echo end of type command tutorial
pause