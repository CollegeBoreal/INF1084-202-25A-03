# service3.ps1
# Objectif : Exporter les logs Directory Service dans un CSV

Write-Host "=== Exportation des journaux Directory Service ===" -ForegroundColor Cyan

$logPath = "C:\Logs\ADLogs.csv"

# Vérifier et créer le dossier C:\Logs si nécessaire
if (!(Test-Path -Path "C:\Logs")) {
    New-Item -ItemType Directory -Path "C:\Logs" | Out-Null
    Write-Host "Dossier C:\Logs créé." -ForegroundColor Yellow
}

# Export des 50 derniers événements Directory Service
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
Export-Csv -Path $logPath -NoTypeInformation

Write-Host "Export terminé avec succès !" -ForegroundColor Green
Write-Host "Fichier créé : $logPath" -ForegroundColor Green
