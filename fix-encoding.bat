@echo off
REM Fix UTF-8 encoding for all markdown and text files
REM This ensures emojis display correctly across all systems

setlocal enabledelayedexpansion

echo.
echo ========================================
echo Fixing UTF-8 Encoding for Repository Files
echo ========================================
echo.

REM Change to repository root
cd /d "%~dp0"

REM Get all markdown files
echo Scanning for markdown files...
for /r %%F in (*.md) do (
    echo Processing: %%F
    REM Read and rewrite file with UTF-8 encoding using PowerShell
    powershell -NoProfile -Command "Get-Content '%%F' -Encoding UTF8 | Set-Content '%%F' -Encoding UTF8"
)

echo.
echo Scanning for text files...
for /r %%F in (*.txt) do (
    echo Processing: %%F
    powershell -NoProfile -Command "Get-Content '%%F' -Encoding UTF8 | Set-Content '%%F' -Encoding UTF8"
)

echo.
echo ========================================
echo ✓ UTF-8 Encoding Fix Complete
echo ========================================
echo.
echo Next steps:
echo 1. Run: git status
echo 2. Run: git add .
echo 3. Run: git commit -m "Fix: Ensure UTF-8 encoding for emoji display"
echo 4. Run: git push origin main
echo.
echo On other systems, run: git pull origin main
echo.
pause
