@echo off
setlocal enabledelayedexpansion
title Offline AI Chatbox - Desktop GUI

echo ========================================================
echo   Launching Offline AI Chatbox (Desktop GUI)
echo   100%% Local, Private, Zero Internet Required
echo ========================================================
echo.

set "PY_BIN="

:: 1. Check if python is accessible in PATH
where python >nul 2>&1
if %ERRORLEVEL% equ 0 (
    python -c "import sys" >nul 2>&1
    if !ERRORLEVEL! equ 0 (
        set "PY_BIN=python"
    )
)

:: 2. Check local Python 3.14 installation
if not defined PY_BIN (
    if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" (
        set "PY_BIN=%LOCALAPPDATA%\Programs\Python\Python314\python.exe"
    )
)

:: 3. Check py launcher
if not defined PY_BIN (
    where py >nul 2>&1
    if %ERRORLEVEL% equ 0 (
        py -3 -c "import sys" >nul 2>&1
        if !ERRORLEVEL! equ 0 (
            set "PY_BIN=py -3"
        )
    )
)

:: 4. Check other standard directories
if not defined PY_BIN (
    for /d %%D in ("%LOCALAPPDATA%\Programs\Python\Python*") do (
        if exist "%%D\python.exe" set "PY_BIN=%%D\python.exe"
    )
)

if not defined PY_BIN (
    for /d %%D in ("%ProgramFiles%\Python*") do (
        if exist "%%D\python.exe" set "PY_BIN=%%D\python.exe"
    )
)

if not defined PY_BIN (
    echo [ERROR] Python was not found on your system!
    echo Please install Python 3.9+ from https://www.python.org/
    pause
    exit /b 1
)

echo [OK] Using Python: !PY_BIN!
echo Starting Desktop GUI...
!PY_BIN! main.py --gui
if %ERRORLEVEL% neq 0 (
    echo.
    echo Application exited with code %ERRORLEVEL%.
    pause
)
