:: A simple batch file which illustrates the usage of a FOR .. IN .. DO loop
:: All the pdf files in the current directory are moved (cut+paste) into a folder named rars

:: for {%% | %}<variable> in (<set>) do <command> [<commandlineoptions>]
:: The set parameter can represent a single group of files or several groups of files
@echo off
mkdir txts
:: For each file in your folder
for %%a in (".\*.txt") do (
move "%%a" ".\txts\"
)

:: Recursive: Walks the directory tree that is rooted at drive:path and executes the for statement
:: for /r [[<drive>:]<path>] {%%|%}<variable> in (<set>) do <command> [<commandlinepptions>]

for /r "c:\delete" %%f in ("*.txt") do (
   copy "%%f" ".\copyDir\"
)
pause

:: iterating a range of values
:: for /l {%%|%}<variable> in (<start#>,<step#>,<end#>) do <command> [<commandlinepptions>]

for /l %%i in (1, 1, 10) do echo %%i
pause