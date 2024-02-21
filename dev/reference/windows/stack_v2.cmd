@echo off
setlocal enabledelayedexpansion

set var_stack=
set /a var_stack_size=0
call :fn_print_stack

call :fn_push Apple
call :fn_print_stack

call :fn_push Banana
call :fn_print_stack

call :fn_push Cherry
call :fn_print_stack

call :fn_push Mango
call :fn_print_stack

call :fn_pop
call :fn_log var_pop_result: !var_pop_result!
call :fn_print_stack

call :fn_pop
call :fn_log var_pop_result: !var_pop_result!
call :fn_print_stack

goto :eof


:fn_push
call :fn_log fn_push called
set var_stack[%var_stack_size%]=%1
set /a var_stack_size+=1
goto :eof


:fn_pop
call :fn_log fn_pop called
set /a var_stack_size-=1
set var_pop_result=!var_stack[%var_stack_size%]!
set var_stack[%var_stack_size%]=
goto :eof


:fn_print_stack
call :fn_log fn_print_stack called
call :fn_log var_stack_size: %var_stack_size%
for /l %%i in (0,1,%var_stack_size%) do (
    if %%i neq %var_stack_size% (
        call :fn_log var_stack[%%i]: !var_stack[%%i]!
    )
)
call :fn_log
goto :eof


:fn_log
if defined BARNA_DEBUG (
    if "%*"=="" (
        echo.
    ) else (
        echo %*
    )
)
goto :eof
