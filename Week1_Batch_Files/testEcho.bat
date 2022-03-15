@echo off
rem spy alert
echo Simple routine check ...
echo just doin' my thing ...
:: echo. creates a blank line
:: Don't include a space before the period because the period will appear not a blank line.
echo.
:: To prevent echoing a particular command in a batch file, insert an @ sign in front of the command
@echo Command won't be shown even if echo is turned on
pause
if not exist *.txt (
echo No files to look for
) else (
   echo This directory contains these .txt files
   echo.
   :: dir command displays a list of a directory's files and subdirectories
   :: /b displays a bare list of directories and files, with no additional information
   :: dir *.txt lists all files in the current directory with extensions that begin with .txt, such as .txt, .txt_test
   dir /b *.txt
   )
pause
echo.
:: You can use the question mark (?) as a substitute for a single character in a name.
:: For example, typing dir read???.txt lists any files in the current directory with the .txt extension 
:: that begin with read and are followed by up to three characters
dir /b test??.txt
:: redirect output of the dir command to a file
dir /b > dir.txt
pause