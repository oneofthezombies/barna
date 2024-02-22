@echo off
setlocal enabledelayedexpansion


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global Variables Begin
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set barna_var__runtime_temp=
set barna_var__runtime_stack=
set /a barna_var__runtime_stack_size=0
set barna_var__runtime_heap=
set /a barna_var__runtime_heap_size=0

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global Variables End
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Main Begin
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@REM call :barna_fn__runtime__stack_push Apple
@REM call :barna_fn__runtime__stack_push Banana
@REM call :barna_fn__runtime__stack_pop my_result my_error
@REM call :barna_fn__runtime__debug result: !my_result! error: !my_error!
@REM call :barna_fn__runtime__exit_on_error my_error
@REM call :barna_fn__runtime__stack_pop my_result my_error
@REM call :barna_fn__runtime__debug result: !my_result! error: !my_error!
@REM call :barna_fn__runtime__exit_on_error my_error
@REM call :barna_fn__runtime__stack_pop my_result my_error
@REM call :barna_fn__runtime__debug result: !my_result! error: !my_error!
@REM call :barna_fn__runtime__exit_on_error my_error
call :barna_fn__runtime__stack_push 1.1
call :barna_fn__runtime__stack_push 2.2
call :barna_fn__runtime__stack_pop register1 my_error
call :barna_fn__runtime__exit_on_error my_error
call :barna_fn__runtime__stack_pop register0 my_error
call :barna_fn__runtime__exit_on_error my_error
set /a register2=register0+register1
call :barna_fn__runtime__stack_push %register2%
call :barna_fn__runtime__stack_print
call :barna_fn__runtime__stack_push 3.3
call :barna_fn__runtime__stack_pop register1 my_error
call :barna_fn__runtime__exit_on_error my_error
call :barna_fn__runtime__stack_pop register0 my_error
call :barna_fn__runtime__exit_on_error my_error
set /a register2=(register0)*(register1)
call :barna_fn__runtime__stack_push %register2%
call :barna_fn__runtime__stack_print
goto :eof


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Main End
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Functions Begin
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `stack` Begin
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    :barna_fn__stack__push
    ::: Add a new element to the stack.
    :::
    ::: Arguments
    :::     arg0: In Variable name - Stack.
    :::     arg1: In Variable name - Stack size.
    :::     arg2: In Value - Element to be added to the stack.
    :::
    ::: Examples
    :::     call :barna_fn__stack__push my_stack my_stack_size Apple
    call :barna_fn__util__function_init %0 %*
    set %~1__!%~2!=%~3
    set /a %~2+=1
    call :barna_fn__runtime__debug size: !%~2!
    call :barna_fn__runtime__debug
    call :barna_fn__util__function_deinit
    goto :eof


    :barna_fn__stack__pop
    ::: Remove the top element from the stack.
    :::
    ::: Arguments
    :::     arg0: In Variable name - Stack.
    :::     arg1: In Variable name - Stack size.
    :::     arg2: Out Variable name - Result.
    :::     arg3: Out Variable name - Error.
    :::
    ::: Examples
    :::     call :barna_fn__stack__pop my_stack my_stack_size my_result
    call :barna_fn__util__function_init %0 %*
    set %~3=
    set %~4=
    if !%~2! equ 0 (
        set %~4=stack %~1 is empty
        call :barna_fn__util__function_deinit
        goto :eof
    )
    set /a %~2-=1
    set barna_var__temp=%~1__!%~2!
    set %~3=!%barna_var__temp%!
    set barna_var__temp=
    set %~1__!%~2!=
    call :barna_fn__runtime__debug size: !%~2!
    call :barna_fn__runtime__debug result: !%~3!
    call :barna_fn__runtime__debug
    call :barna_fn__util__function_deinit
    goto :eof


    :barna_fn__stack__print
    ::: Print the stack to the console if the BARNA_DEBUG environment variable is set.
    :::
    ::: Arguments
    :::     arg0: In Variable name - Stack.
    :::     arg1: In Variable name - Stack size.
    :::
    ::: Examples
    :::     call :barna_fn__stack__print my_stack my_stack_size
    call :barna_fn__util__function_init %0 %*
    call :barna_fn__runtime__debug size: !%~2!
    for /l %%i in (0,1,!%~2!) do (
        if %%i neq !%~2! (
            call :barna_fn__runtime__debug element %%i: !%~1__%%i!
        )
    )
    call :barna_fn__runtime__debug
    call :barna_fn__util__function_deinit
    goto :eof

    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `stack` End
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `runtime` Begin
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    :barna_fn__runtime__debug
    ::: Print the message to the console if the BARNA_DEBUG environment variable is set.
    :::
    ::: Arguments
    :::     args: In Arguments - Message to be printed.
    :::
    ::: Examples
    :::     call :barna_fn__runtime__debug Hello, World!
    if defined BARNA_DEBUG (
        if "%*" == "" (
            echo.
        ) else (
            echo %*
        )
    )
    goto :eof


    :barna_fn__runtime__stack_push
    ::: Add a new element to the runtime stack.
    :::
    ::: Arguments
    :::     arg0: In Value - Element to be added to the stack.
    :::
    ::: Examples
    :::     call :barna_fn__runtime__stack_push Apple
    call :barna_fn__util__function_init %0 %*
    call :barna_fn__stack__push barna_var__runtime_stack barna_var__runtime_stack_size %*
    call :barna_fn__util__function_deinit
    goto :eof


    :barna_fn__runtime__stack_pop
    ::: Remove the top element from the runtime stack.
    :::
    ::: Arguments
    :::     arg0: Out Variable name - Result.
    :::     arg1: Out Variable name - Error.
    :::
    ::: Examples
    :::     call :barna_fn__runtime__stack_pop my_result
    call :barna_fn__util__function_init %0 %*
    call :barna_fn__stack__pop barna_var__runtime_stack barna_var__runtime_stack_size %~1 %~2
    call :barna_fn__util__function_deinit
    goto :eof


    :barna_fn__runtime__stack_print
    ::: Print the runtime stack to the console if the BARNA_DEBUG environment variable is set.
    :::
    ::: Examples
    :::     call :barna_fn__runtime__stack_print
    call :barna_fn__util__function_init %0 %*
    call :barna_fn__stack__print barna_var__runtime_stack barna_var__runtime_stack_size
    call :barna_fn__util__function_deinit
    goto :eof


    :barna_fn__runtime__exit_on_error
    ::: Exit the script if the runtime error message is not empty.
    :::
    ::: Arguments
    :::     args: In Arguments - Error message.
    :::
    ::: Examples
    :::     call :barna_fn__runtime__exit_on_error barna_var__error
    call :barna_fn__util__function_init %0 %*
    if defined %~1 (
        call :barna_fn__runtime__debug %~1
        call :barna_fn__util__function_deinit
        exit /b 1
    )
    call :barna_fn__util__function_deinit
    goto :eof


    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `runtime` End
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `util` Begin
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


    :barna_fn__util__function_init
    ::: Initialize the function. This function should be called at the beginning of each function.
    ::: Print the function name to the console if the BARNA_DEBUG environment variable is set.
    ::: Reset the runtime error message.
    :::
    ::: Arguments
    :::     args: In Arguments - Function name and arguments.
    :::
    ::: Examples
    :::     call :barna_fn__util__function_init %0 %*
    call :barna_fn__runtime__debug %* called
    goto :eof


    :barna_fn__util__function_deinit
    ::: Deinitialize the function. This function should be called at the end of each function.
    ::: Reset the runtime temp variables.
    :::
    ::: Examples
    :::     call :barna_fn__util__function_deinit
    set barna_var__runtime_temp=
    goto :eof


    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :: Functions `util` End
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Functions End
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
