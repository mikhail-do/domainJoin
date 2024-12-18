@echo off

:: Проверка, запущен ли скрипт от имени администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Administrator rights required, restarting...
    echo.
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

:: Установка политики выполнения скриптов
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope Process -Force"

:: Запуск скрипта
powershell -ExecutionPolicy Bypass -File "%~dp0configScript.ps1"