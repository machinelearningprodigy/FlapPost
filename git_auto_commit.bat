@echo off
setlocal EnableDelayedExpansion

:: Check if git is installed
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Git is not installed or not in PATH
    pause
    exit /b 1
)

:: Check if we're in a git repository
git rev-parse --is-inside-work-tree >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Not a git repository
    pause
    exit /b 1
)

:: Define messages
set "add[1]=Added"
set "add[2]=Adding this file"
set "add[3]=New file added"
set "add[4]=Adding file"

set "upd[1]=Updated"
set "upd[2]=Updating"
set "upd[3]=Changes applied"
set "upd[4]=Modified"

:: Handle new files
for /f "delims=" %%f in ('git ls-files --others --exclude-standard') do (
    set /a rand=(!random! %% 4) + 1
    git add "%%f"
    for %%n in (!rand!) do echo !add[%%n]!: %%~nxf
    for %%n in (!rand!) do git commit -m "!add[%%n]!: %%~nxf"
)

:: Handle modified files
for /f "delims=" %%f in ('git ls-files -m') do (
    set /a rand=(!random! %% 4) + 1
    git add "%%f"
    for %%n in (!rand!) do echo !upd[%%n]!: %%~nxf
    for %%n in (!rand!) do git commit -m "!upd[%%n]!: %%~nxf"
)

:: Push changes
git remote | findstr "origin" >nul
if %ERRORLEVEL% EQU 0 (
    echo Pushing changes to origin...
    git push -u -f origin main
) else (
    echo No remote 'origin' found. Skipping push.
)

echo Script completed successfully!
pause