# 3 - Créer un nouvel utilisateur dans le domaine de Karim

. "$PSScriptRoot\bootstrap.ps1"     # charge $domainName, $netbiosName, $cred
Import-Module ActiveDirectory       # charge le module AD

# Mot de passe du nouvel utilisateur
$pwd = Read-Host -AsSecureString "Entrer le mot de passe pour le nouvel utilisateur"

# Création de l'utilisateur
New-ADUser -Name "Karim Niang" `
           -GivenName "Karim" `
           -Surname "Niang" `
           -SamAccountName "karim.niang" `
           -UserPrincipalName "karim.niang@$domainName" `
           -AccountPassword $pwd `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local"


# Vérifier que l'utilisateur existe bien
Get-ADUser -Identity "karim.niang" -Server $domainName `
    | Select-Object Name, SamAccountName, Enabled
