# services3_simple.ps1

# Créer dossier + exporter
New-Item -Path "C:\Logs" -ItemType Directory -Force
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation

# Message de confirmation
Write-Host "Logs exportés vers C:\Logs\ADLogs.csv" -ForegroundColor Green
