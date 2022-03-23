@echo off
:: suppose all the arguments appear twice except for one
:: find the unique one

set /a xor=0
:xor_loop
if "%1" == "" goto :end
set /a next=%1
set /a xor="(%xor% ^ %next%)"
shift
goto xor_loop
:end
echo the unique element is %xor%