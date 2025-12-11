# utilisateurs5.ps1
Write-Host "=== RÉACTIVATION UTILISATEUR AD ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory

Write-Host "`n Statut avant..." -ForegroundColor Cyan
$userAvant = Get-ADUser -Identity "alice.dupont" -Properties Enabled
Write-Host "Compte: alice.dupont" -ForegroundColor Gray
Write-Host "Activé: $($userAvant.Enabled)" -ForegroundColor $(if ($userAvant.Enabled) {"Green"} else {"Red"})

if ($userAvant.Enabled -eq $false) {
    Write-Host "`n Réactivation..." -ForegroundColor Cyan
    Enable-ADAccount -Identity "alice.dupont"
    Write-Host " Compte réactivé!" -ForegroundColor Green
    
    Write-Host "`n Vérification..." -ForegroundColor Cyan
    $userApres = Get-ADUser -Identity "alice.dupont" -Properties Enabled
    Write-Host "Activé: $($userApres.Enabled)  RÉACTIVÉ" -ForegroundColor Green
} else {
    Write-Host "  Compte déjà activé!" -ForegroundColor Yellow
}

Write-Host "`n Terminé!" -ForegroundColor Green
