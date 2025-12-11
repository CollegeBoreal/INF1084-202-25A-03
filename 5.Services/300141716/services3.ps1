# services3.ps1
# Exporter les 50 derniers événements AD dans un fichier CSV
$exportPath = "C:\Logs\ADLogs.csv"

# Crée le dossier si nécessaire
if (-not (Test-Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs"
}

Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
    Export-Csv -Path $exportPath -NoTypeInformation

Write-Host "Événements exportés dans $exportPath" -ForegroundColor Green

