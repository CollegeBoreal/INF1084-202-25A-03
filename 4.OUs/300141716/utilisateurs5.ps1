# 5. Désactiver un utilisateur
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== DÉSACTIVATION D'UN UTILISATEUR ===" -ForegroundColor Yellow

# Créer un utilisateur test d'abord
New-ADUser -Name "Test User" `
           -SamAccountName "test.user" `
           -UserPrincipalName "test.user@$domainName" `
           -AccountPassword (ConvertTo-SecureString "Maroc@2025!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred `
           -ErrorAction SilentlyContinue

# Désactiver l'utilisateur
Disable-ADAccount -Identity "test.user" -Credential $cred

Write-Host "✅ Utilisateur test.user désactivé" -ForegroundColor Green
