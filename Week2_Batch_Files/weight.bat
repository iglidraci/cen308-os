:: A simple batch file illustrating the IF selection structures in combination with 
:: comparison operators for numerical values. The concrete example determines the 
:: category in which a boxer will compete according to his weight.

:: GEQ Checks to see if the left object is greater than or equal to the right operand

@ECHO OFF

IF %1 GEQ 90 (
ECHO You are going to compete in the heavy-weight section.
GOTO :EOF
)

IF %1 GEQ 65 (
ECHO You are going to compete in the mid-weight section.
GOTO :EOF
)


IF %1 GEQ 50 (
ECHO You are going to compete in the light-weight section.
GOTO :EOF
)

ECHO Your weight is too small, you cannot compete.
