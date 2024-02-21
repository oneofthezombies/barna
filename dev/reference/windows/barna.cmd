@echo off


set state="|%1"


:label_begin
if state == "option|--help" (
    call :fn_print_help
    goto label_end
)
goto :label_begin


:fn_print_help
echo.
echo Usage: barna.cmd [options] [file]
echo.
echo Options:
echo   --help, -h  Show this help message
echo   --version, -v  Show version
echo   --command, -c  Run a command
echo.
echo Examples:
echo   barna --help
echo   barna --version
echo   barna file.barna
echo   barna -c "print(""Hello, World!"")"
echo.
goto label_begin


:label_end
