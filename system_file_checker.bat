@echo off
setlocal enabledelayedexpansion

:: Check system folder path
set "SYSTEM32=%WINDIR%\System32"

call :header
call :check_important_files

:main_loop
echo.
echo MENU
echo 1 - Check important Windows files again
echo 2 - Scan and save ALL System32 files
echo 3 - Run SFC /verifyonly
echo 4 - Exit
echo.

set /p "choice=Choose an option: "

if "%choice%"=="1" (
    call :check_important_files
    goto main_loop
)
if "%choice%"=="2" (
    call :scan_all_system32_files
    goto main_loop
)
if "%choice%"=="3" (
    call :run_sfc
    goto main_loop
)
if "%choice%"=="4" (
    echo.
    echo Goodbye!
    goto exit_script
)

echo.
echo Invalid choice. Please select 1, 2, 3, or 4.
goto main_loop

:header
echo ====================================================================
echo                  WINDOWS SYSTEM FILE CHECKER
echo ====================================================================
echo Windows folder : %WINDIR%
echo System32       : %SYSTEM32%
echo ====================================================================
exit /b

:check_important_files
set "found_count=0"
set "missing_count=0"

echo.
echo Checking important Windows files...
echo.

set "IMPORTANT_FILES=notepad.exe calc.exe cmd.exe mspaint.exe explorer.exe winver.exe control.exe services.exe regedit.exe taskmgr.exe msconfig.exe eventvwr.exe perfmon.exe dxdiag.exe charmap.exe magnify.exe osk.exe verifier.exe wscript.exe cscript.exe powershell.exe powershell_ise.exe shutdown.exe systeminfo.exe whoami.exe ipconfig.exe netstat.exe ping.exe tracert.exe nslookup.exe pathping.exe ftp.exe certutil.exe cipher.exe sfc.exe dism.exe tasklist.exe taskkill.exe driverquery.exe hostname.exe where.exe findstr.exe robocopy.exe xcopy.exe format.com diskpart.exe chkdsk.exe defrag.exe cleanmgr.exe mrt.exe"

for %%F in (%IMPORTANT_FILES%) do (
    if exist "%SYSTEM32%\%%F" (
        echo [ OK ]      %%F
        set /a "found_count+=1"
    ) else (
        echo [MISSING]   %%F
        set /a "missing_count+=1"
    )
)

echo.
echo --------------------------------------------------------------------
echo Found:   !found_count!
echo Missing: !missing_count!
echo --------------------------------------------------------------------
exit /b

:scan_all_system32_files
echo.
echo Scanning every file directly inside System32...
echo This may take a moment.
echo.

set "output_file=system32_file_list.txt"

if exist "%output_file%" del "%output_file%"

set "total_files=0"
for /f "delims=" %%i in ('dir /b /a-d "%SYSTEM32%\*" 2^>nul') do (
    echo %SYSTEM32%\%%i >> "%output_file%"
    set /a "total_files+=1"
)

echo Total files found: !total_files!
echo Saved complete file list to: %~dp0%output_file%
exit /b

:run_sfc
echo.
echo Starting Windows System File Checker...
echo Command: sfc /verifyonly
echo This verifies system files without attempting repairs.
echo.

sfc /verifyonly
set "sfc_code=%errorlevel%"

echo.
echo SFC finished with exit code: %sfc_code%
exit /b

:exit_script
echo.
pause