@echo off
setlocal enabledelayedexpansion

:: 초기화
set "heap="



:: 사용 예
call :alloc "Data1"
call :alloc "Data2"
call :dealloc 0
call :alloc "Data3"
goto :eof

:: 메모리 할당 함수
:alloc
set /a pos=0
:findSlot
if defined heap[%pos%] (
    set /a pos+=1
    goto findSlot
)
set heap[%pos%]=%1
echo Allocated %1 at %pos%
goto :eof

:: 메모리 해제 함수
:dealloc
set heap[%1]=
echo Deallocated at %1
goto :eof