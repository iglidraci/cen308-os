@echo off 
SET a="Hello Universe"
SET b=
if [%a%]==[] (echo "String a is empty") else (echo String a is %a%)
if [%b%]==[] (echo "String b is empty") else (echo String b is %b%)

:: string interpolation
SET a=Foo
SET b=Bar
SET /a c=10 
SET d=%a% and %b% together for %c% years
echo %d%

:: to int
set var=10
set /a var=%var% + 5
echo %var%

:: range of a string
set str=FooBar 
echo %str%

set str=%str:~1,-2% 
echo %str%

:: replace part of a string
set str=%str:Ba=Quux% 
echo %str%