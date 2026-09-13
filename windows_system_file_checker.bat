@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Windows System File Checker

echo ============================================================
echo              WINDOWS SYSTEM FILE CHECKER
echo ============================================================
echo.
echo This tool checks common Windows System32 files.
echo It does not delete, modify, or repair files.
echo.
pause

set "SYSTEM32=%WINDIR%\System32"

if not exist "%SYSTEM32%" (
    echo.
    echo ERROR: System32 folder was not found.
    pause
    exit /b 1
)

set /a FOUND=0
set /a MISSING=0

echo.
echo Checking: %SYSTEM32%
echo.

for %%F in (
    notepad.exe
    calc.exe
    cmd.exe
    mspaint.exe
    explorer.exe
    winver.exe
    control.exe
    services.exe
    regedit.exe
    taskmgr.exe
    msconfig.exe
    eventvwr.exe
    perfmon.exe
    dxdiag.exe
    charmap.exe
    magnify.exe
    osk.exe
    verifier.exe
    wscript.exe
    cscript.exe
    powershell.exe
    powershell_ise.exe
    shutdown.exe
    systeminfo.exe
    whoami.exe
    ipconfig.exe
    netstat.exe
    ping.exe
    tracert.exe
    nslookup.exe
    pathping.exe
    ftp.exe
    certutil.exe
    cipher.exe
    sfc.exe
    dism.exe
    tasklist.exe
    taskkill.exe
    driverquery.exe
    hostname.exe
    where.exe
    findstr.exe
    robocopy.exe
    xcopy.exe
    format.com
    diskpart.exe
    chkdsk.exe
    defrag.exe
    cleanmgr.exe
    mrt.exe
) do (
    if exist "%SYSTEM32%\%%F" (
        echo [OK]      %%F
        set /a FOUND+=1
    ) else (
        echo [MISSING] %%F
        set /a MISSING+=1
    )
)

echo.
echo ============================================================
echo FOUND:   %FOUND%
echo MISSING: %MISSING%
echo ============================================================
echo.
echo NOTE:
echo A missing file in this list does not automatically mean Windows
echo is damaged. Some Windows versions do not include every program.
echo.
choice /C YN /N /M "Run Windows SFC verification now? [Y/N]: "

if errorlevel 2 goto END

echo.
echo Running SFC /VERIFYONLY...
echo This may take several minutes.
echo.
sfc /verifyonly

:END
echo.
echo ============================================================
echo Finished.
echo ============================================================
pause
endlocal
