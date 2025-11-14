# modifier-utilisateur.ps1
Write-Host "=== MODIFICATION UTILISATEUR AD ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory

Write-Host "`n Avant modification..." -ForegroundColor Cyan
$userAvant = Get-ADUser -Identity "alice.dupont" -Properties GivenName, EmailAddress, DisplayName
Write-Host "Prénom: $($userAvant.GivenName)" -ForegroundColor Gray
Write-Host "Email: $($userAvant.EmailAddress)" -ForegroundColor Gray

Write-Host "`n Modification en cours..." -ForegroundColor Cyan
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -DisplayName "Alice-Marie Dupont" `
           -Description "Utilisatrice modifiée par PowerShell"

Write-Host "`n Après modification..." -ForegroundColor Cyan
$userApres = Get-ADUser -Identity "alice.dupont" -Properties GivenName, EmailAddress, DisplayName, Description
Write-Host "Prénom: $($userApres.GivenName)  MODIFIÉ" -ForegroundColor Green
Write-Host "Email: $($userApres.EmailAddress)  MODIFIÉ" -ForegroundColor Green
Write-Host "Description: $($userApres.Description)  AJOUTÉ" -ForegroundColor Green

Write-Host "`n Terminé!" -ForegroundColor Green
