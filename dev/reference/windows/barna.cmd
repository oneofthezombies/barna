@echo off

set var=1

:loop
if %var%==10 goto :end
echo %var%
set /a var=%var%+1
goto :loop

:end
