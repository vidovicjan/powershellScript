#Uninstalling apps

Get-AppxPackage *alarms* | Remove-AppxPackage
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *acg* | Remove-AppxPackage
Get-AppxPackage *communications* | Remove-AppxPackage
Get-AppxPackage *camera* | Remove-AppxPackage
Get-AppxPackage *dolbyaccess* | Remove-AppxPackage
Get-AppxPackage *fitbitcoach* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *maps* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
# Get-AppxPackage *people* | Remove-AppxPackage - not in use 
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *phototastic* | Remove-AppxPackage
Get-AppxPackage *picsart* | Remove-AppxPackage
Get-AppxPackage *plex* | Remove-AppxPackage
Get-AppxPackage *bingsports* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *bingweather* | Remove-AppxPackage
Get-AppxPackage *xbox* | Remove-AppxPackage
Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage
Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage


# Disabling background apps
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f

# Install Google Chrome 

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir$ChromeInstaller"); & "$LocalTempDir$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)


# Restarts your local machine
Restart-Computer -Confirm