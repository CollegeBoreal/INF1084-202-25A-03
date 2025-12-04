# services4.ps1
# Objectif : Arrêt et redémarrage d’un service Active Directory (DFSR)

Write-Host "=== Etat actuel du service DFSR ===" -ForegroundColor Cyan
Get-Service -Name DFSR | Format-Table Name, Status -AutoSize

Write-Host "`n>>> Arrêt du service DFSR ..." -ForegroundColor Yellow
Stop-Service -Name DFSR -Force

Start-Sleep -Seconds 2

Write-Host "`n=== Etat après l'arrêt ===" -ForegroundColor Cyan
Get-Service -Name DFSR | Format-Table Name, Status -AutoSize

Write-Host "`n>>> Redémarrage du service DFSR ..." -ForegroundColor Yellow
Start-Service -Name DFSR

Start-Sleep -Seconds 2

Write-Host "`n=== État final du service DFSR ===" -ForegroundColor Green
Get-Service -Name DFSR | Format-Table Name, Status -AutoSize

Write-Host "`nOpération terminée avec succès !" -ForegroundColor Green
