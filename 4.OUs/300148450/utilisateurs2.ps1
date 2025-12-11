<# =========================================================
 Script utilisateurs2.ps1 – Création / Modification / Activation
========================================================= #>

# Charger le bootstrap
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== 1. Création de l'utilisateur Alice Dupont ==="

New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

Write-Host "=== 2. Modification de l'utilisateur ==="

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

Write-Host "=== 3. Désactivation de l'utilisateur ==="
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

Write-Host "=== 4. Réactivation de l'utilisateur ==="
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

