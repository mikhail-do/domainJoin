@echo off

:: Checking if the script is running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Administrator rights required, restarting...
    echo.
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

:: Setting the Script Execution Policy
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope Process -Force"

:: Running the script
powershell -ExecutionPolicy Bypass -File "%~dp0configScript.ps1"