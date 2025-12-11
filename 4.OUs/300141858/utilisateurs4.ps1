# 4 - Modifier un utilisateur du domaine de Karim

. "$PSScriptRoot\bootstrap.ps1"
Import-Module ActiveDirectory

$User = "student1"

# 1) Modifier le prénom et le nom
Set-ADUser -Identity $User `
    -GivenName "Etudiant" `
    -Surname "Modifie" `
    -Server $domainName

# 2) Modifier le DisplayName
Set-ADUser -Identity $User `
    -DisplayName "Etudiant Modifie" `
    -Server $domainName

# 3) Permettre expiration + forcer changement mot de passe (optionnel)
Set-ADUser -Identity $User `
    -PasswordNeverExpires $false `
    -Server $domainName

Set-ADUser -Identity $User `
    -ChangePasswordAtLogon $true `
    -Server $domainName

# 4) Vérifier l'utilisateur
Get-ADUser -Identity $User `
    -Properties DisplayName, GivenName, Surname, Enabled `
    -Server $domainName |
    Select-Object SamAccountName, GivenName, Surname, DisplayName, Enabled
