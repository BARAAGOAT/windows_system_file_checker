@echo off
title Windows SFC Verify Only

echo ============================================================
echo              WINDOWS SFC VERIFY ONLY
echo ============================================================
echo.
echo Running: sfc /verifyonly
echo.
echo This checks Windows system file integrity.
echo It does NOT repair or modify files.
echo.
echo Please wait...
echo.

sfc /verifyonly

echo.
echo ============================================================
echo SFC verification finished.
echo ============================================================
echo.
pause