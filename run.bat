@echo off

if "%~1"=="" (
    echo Usage: %0 ^<file_name^>
    exit /b 1
)

nasm -f bin %1 -o output.bin

if errorlevel 1 (
    echo Assembly failed
    exit /b 1
)

"C:\Program Files\qemu\qemu-system-x86_64.exe" output.bin
