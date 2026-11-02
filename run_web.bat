@echo off
setlocal enabledelayedexpansion
title Offline AI Chatbox - Web Browser UI

echo ========================================================
echo   Launching Offline AI Chatbox (Web UI)
echo   Opening in your default browser at http://127.0.0.1:8080
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

echo [OK] Using Python: !PY_BIN!
!PY_BIN! main.py --web --port 8080
pause
