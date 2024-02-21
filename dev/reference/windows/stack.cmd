@echo off
setlocal enabledelayedexpansion

echo stack: !stack!

call :fn_push Apple
echo stack: !stack!

call :fn_push Banana
echo stack: !stack!

call :fn_push Cherry
echo stack: !stack!

call :fn_pop
echo pop_result: !pop_result!
echo stack: !stack!

call :fn_pop
echo pop_result: !pop_result!
echo stack: !stack!

goto :eof


:fn_push
set "item=%~1"
set "stack=!item! !stack!"
goto :eof


:fn_pop
if "!stack!"=="" (
    echo Stack is empty.
    goto :eof
)

for /f "tokens=1,* delims= " %%a in ("!stack!") do (
    set "pop_result=%%a"
    set "stack=%%b"
)

goto :eof
