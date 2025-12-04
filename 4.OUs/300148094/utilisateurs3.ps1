# utilisateurs3.ps1
. .\bootstrap.ps1

Write-Host "Désactivation d'utilisateurs..." -ForegroundColor Cyan
Disable-ADAccount -Identity "alice.dupont"

Write-Host "Réactivation d'utilisateurs..." -ForegroundColor Cyan
Enable-ADAccount -Identity "alice.dupont" 
