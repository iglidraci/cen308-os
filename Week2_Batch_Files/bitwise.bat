@echo off
SET /a "r = 1 & 0"
echo %r%
SET /a "r = 16 | 16"
echo %r%
SET /a "r = 15 ^ 15"
echo %r%
set /a "r = r ^ 9"
echo %r%