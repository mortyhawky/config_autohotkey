cd $HOME
Write-Host "`$Env:KOMOREBI_CONFIG_HOME="$Env:KOMOREBI_CONFIG_HOME

& "C:\scoop\apps\komorebi\current\komorebic.exe start"
return

Start-Process -FilePath 'c:\scoop\apps\komorebi\current\komorebi.exe' `
  -ArgumentList '--config="C:\Users\morty\.config\komorebi\komorebi.json"'

