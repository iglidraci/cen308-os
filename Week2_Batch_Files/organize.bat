:: A batch file which organizes all the files in the current directory (folder)
:: into several subdirectories (subfolders) according to the extensions of the files.

@echo off

rem For each file in your folder
for %%a in (".\*") do (
rem check if the file has an extension and if it is not our script
rem ~xI	Expands %I to a file name extension only.
rem ~nxI	Expands %I to a file name and extension only.
rem check if the file has an extension and it is not our script
if "%%~xa" NEQ "" if "%%~nxa" NEQ "%~nx0" (
rem check if extension folder exists, if not it is created
if not exist "%%~xa" mkdir "%%~xa"
rem Move/copy the file to directory
if "%%~xa" EQU ".bat" (copy "%%a" "%%~xa\") else (
   move "%%a" "%%~xa\"
)
))