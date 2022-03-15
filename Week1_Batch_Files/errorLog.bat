@echo off
goto   part%errorlevel%
:part1
echo The program returned error level 1
goto end
:part0
echo The program returned error level 0
goto end
:end
echo Done!
pause