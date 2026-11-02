@echo off
setlocal enabledelayedexpansion
title Offline AI Chatbox - Terminal CLI

echo ========================================================
echo   Launching Offline AI Chatbox (Terminal CLI)
echo ========================================================
echo.

set "PY_BIN="

where python >nul 2>&1
if %ERRORLEVEL% equ 0 (
    python -c "import sys" >nul 2>&1
    if !ERRORLEVEL! equ 0 set "PY_BIN=python"
)

if not defined PY_BIN (
    if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" (
        set "PY_BIN=%LOCALAPPDATA%\Programs\Python\Python314\python.exe"
    )
)

if not defined PY_BIN (
    where py >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        py -3 -c "import sys" >nul 2>&1
        if !ERRORLEVEL! equ 0 set "PY_BIN=py -3"
    )
)

if not defined PY_BIN (
    for /d %%D in ("%LOCALAPPDATA%\Programs\Python\Python*") do (
        if exist "%%D\python.exe" set "PY_BIN=%%D\python.exe"
    )
)

if not defined PY_BIN (
    echo [ERROR] Python was not found on your system!
    pause
    exit /b 1
)

!PY_BIN! main.py --cli
pause
