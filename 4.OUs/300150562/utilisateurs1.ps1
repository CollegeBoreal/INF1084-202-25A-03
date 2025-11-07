# creer-utilisateur.ps1
Write-Host "=== CREATION UTILISATEUR AD ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory
$domainName = "DC300150562-00.local"
$netbiosName = "DC300150562-00"

Write-Host "`n Création Alice Dupont..." -ForegroundColor Cyan

try {
    New-ADUser -Name "Alice Dupont" `
               -GivenName "Alice" `
               -Surname "Dupont" `
               -SamAccountName "alice.dupont" `
               -UserPrincipalName "alice.dupont@$domainName" `
               -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
               -Enabled $true `
               -Path "CN=Users,DC=$netbiosName,DC=local" `
               -ChangePasswordAtLogon $true
    
    Write-Host " Utilisateur créé !" -ForegroundColor Green
    
    # Vérification
    $user = Get-ADUser -Identity "alice.dupont" -Properties *
    Write-Host "Vérification:" -ForegroundColor Gray
    Write-Host " - Nom: $($user.Name)" -ForegroundColor Gray
    Write-Host " - Compte: $($user.SamAccountName)" -ForegroundColor Gray
    Write-Host " - Activé: $($user.Enabled)" -ForegroundColor Gray
    
} catch {
    Write-Host " Erreur: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n Terminé!" -ForegroundColor Green
