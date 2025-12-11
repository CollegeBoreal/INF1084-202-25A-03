🌼TP : Gestion des utilisateurs Active Directory avec PowerShell

🔢 Creation du boostrap.ps1
```
# ==========================
#   Informations étudiant
# ==========================

$studentNumber = 300142072
$studentInstance = 50

# Domaines générés
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Import module Active Directory
Import-Module ActiveDirectory
```
🔢 Preparation de l'environnement
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

🔢 Liste des utilisateurs du domaine

```

. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```
🔢Créer un nouvel utilisateur
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred
```
🔢Modifier un utilisateur
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred
```
🔢Désactiver un utilisateur
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Disable-ADAccount -Identity "alice.dupont" -Credential $cred
```
🔢Réactiver un utilisateur
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Enable-ADAccount -Identity "alice.dupont" -Credential $cred
```
🔢Supprimer un utilisateur
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred
```
🔢Rechercher des utilisateurs avec un filtre

```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
```
🔢Exporter les utilisateurs dans un CSV
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
```
🔢 Déplacer un utilisateur vers une OU Students
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

# Déplacement d'Alice
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

# Vérification
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName
```
❗: j'ai mis toutes les captures relatives a ce projet dans le dossier images. Ca s'aappelle serviceobject.




