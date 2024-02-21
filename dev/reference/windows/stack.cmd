@echo off
setlocal enabledelayedexpansion

set "var_stack="
echo var_stack: !var_stack!

call :fn_push Apple
echo var_stack: !var_stack!

call :fn_push Banana
echo var_stack: !var_stack!

call :fn_push Cherry
echo var_stack: !var_stack!

call :fn_pop
echo var_pop_result: !var_pop_result!
echo var_stack: !var_stack!

call :fn_pop
echo var_pop_result: !var_pop_result!
echo var_stack: !var_stack!

goto :eof


:fn_push
set "var_push_item=%~1"
set "var_stack=!var_push_item! !var_stack!"
goto :eof


:fn_pop
if "!var_stack!"=="" (
    echo var_stack is empty.
    goto :eof
)

for /f "tokens=1,* delims= " %%a in ("!var_stack!") do (
    set "var_pop_result=%%a"
    set "var_stack=%%b"
)

goto :eof
