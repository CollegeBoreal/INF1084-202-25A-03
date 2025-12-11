# utilisateurs6.ps1
Write-Host "=== SUPPRESSION UTILISATEUR AD ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory

Write-Host "`n Vérification avant suppression..." -ForegroundColor Cyan
$userAvant = Get-ADUser -Identity "alice.dupont" -Properties Name, SamAccountName
Write-Host "Utilisateur à supprimer:" -ForegroundColor Yellow
Write-Host " - Nom: $($userAvant.Name)" -ForegroundColor Gray
Write-Host " - Compte: $($userAvant.SamAccountName)" -ForegroundColor Gray

Write-Host "`n  SUPPRESSION IRREVERSIBLE!" -ForegroundColor Red
Write-Host "`n  Suppression en cours..." -ForegroundColor Cyan
Remove-ADUser -Identity "alice.dupont" -Confirm:$false
Write-Host " Utilisateur supprimé!" -ForegroundColor Green

Write-Host "`n Vérification..." -ForegroundColor Cyan
try {
    Get-ADUser -Identity "alice.dupont" -ErrorAction Stop
    Write-Host " L'utilisateur existe toujours!" -ForegroundColor Red
} catch {
    Write-Host " Utilisateur bien supprimé (non trouvé)" -ForegroundColor Green
}

Write-Host "`n Terminé!" -ForegroundColor Green
