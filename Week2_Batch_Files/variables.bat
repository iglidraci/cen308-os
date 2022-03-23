:: set [/p] <variable>=[<promptString>]
:: /p set [/p] <variable>=[<promptString>]
:: Specifies a message to prompt the user for input. This parameter must be used with the /p parameter.
@echo off
set /p name="enter your name:"
echo your name is %name%
:: /a Sets <string> to a numerical expression that is evaluated.
set /p nr1="enter first number:"
set /p nr2="enter the second number:"
set /a sum=%nr1%+%nr2%
set /a dif=%nr1%-%nr2%
set /a div=%nr1%/%nr2%
set /a mod =%nr1% %% %nr2%
echo %nr1% + %nr2% = %sum%
echo %nr1% - %nr2% = %dif%
echo %nr1% / %nr2% = %div%
echo %nr1% %% %nr2% = %mod%
pause