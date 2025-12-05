# services4.ps1
# Arrêter et redémarrer le service DFSR

Write-Host "Arrêt du service DFSR..." -ForegroundColor Cyan
Stop-Service -Name DFSR
Write-Host "État après arrêt :" -ForegroundColor Yellow
(Get-Service -Name DFSR).Status

Write-Host "Redémarrage du service DFSR..." -ForegroundColor Cyan
Start-Service -Name DFSR
Write-Host "État après redémarrage :" -ForegroundColor Yellow
(Get-Service -Name DFSR).Status
