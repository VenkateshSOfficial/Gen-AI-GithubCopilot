@echo off
REM ============================================
REM One-Click Fix: Emoji Display on Cloned Repo
REM ============================================

echo.
echo ============================================
echo Emoji Display Fix - One-Click Setup
echo ============================================
echo.

REM Get the repository path
set "REPO_PATH=%~dp0"
cd /d "%REPO_PATH%"

echo Repository: %cd%
echo.

REM Step 1: Pull latest changes
echo [STEP 1/5] Pulling latest changes from GitHub...
git pull origin master
if errorlevel 1 (
    echo ERROR: Failed to pull. Check your internet connection.
    pause
    exit /b 1
)
echo ✓ Pull complete
echo.

REM Step 2: Configure Git encoding settings
echo [STEP 2/5] Configuring Git encoding settings...
git config core.safecrlf false
git config core.autocrlf input
echo ✓ Git configured for UTF-8
echo.

REM Step 3: Clear Git cache
echo [STEP 3/5] Clearing Git cache...
git rm --cached -r . 2>nul
echo ✓ Cache cleared
echo.

REM Step 4: Reset files
echo [STEP 4/5] Resetting files to GitHub version...
git reset --hard HEAD
echo ✓ Files reset
echo.

REM Step 5: Verification
echo [STEP 5/5] Verifying setup...
if exist ".gitattributes" (
    echo ✓ .gitattributes found (UTF-8 encoding enforced)
) else (
    echo ! Warning: .gitattributes not found
)

echo.
echo ============================================
echo ✓ SETUP COMPLETE!
echo ============================================
echo.
echo Next: Open a test file to verify emojis
echo   File: requirements/jaywan_test_cases_v3.md
echo.
echo You should see:
echo   ✅ Green checkmarks
echo   ❌ Red X marks
echo   ⚠️  Yellow warnings
echo   1️⃣2️⃣3️⃣... Section numbers
echo.
echo If emojis don't show:
echo   1. Check VS Code encoding (bottom right)
echo   2. Ensure set to "UTF-8"
echo   3. Reload the file
echo.

pause
