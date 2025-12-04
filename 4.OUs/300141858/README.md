# 300141858

## 0️⃣ Nom du domaine basé sur le numéro étudiant

```powershell
$studentNumber = 300141858
$studentInstance = "01"

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

1️⃣ Préparer l’environnement
# Importer le module Active Directory
Import-Module ActiveDirectory

# Vérifier le domaine et le contrôleur de domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

2️⃣ Liste des utilisateurs du domaine
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

3️⃣ Créer un nouvel utilisateur
New-ADUser `
  -Name "Karim Niang" `
  -GivenName "Karim" `
  -Surname "Niang" `
  -SamAccountName "karim.niang" `
  -UserPrincipalName "karim.niang@$domainName" `
  -Path "CN=Users,DC=$netbiosName,DC=local" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true

4️⃣ Modifier un utilisateur
Set-ADUser -Identity "karim.niang" `
           -EmailAddress "karim.niang@example.com" `
           -GivenName "Karim-Ali"

5️⃣ Désactiver et Réactiver un utilisateur
Disable-ADAccount -Identity "karim.niang"
Enable-ADAccount -Identity "karim.niang"

6️⃣ Supprimer un utilisateur
Remove-ADUser -Identity "karim.niang" -Confirm:$false

7️⃣ Exporter les utilisateurs vers un fichier CSV
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

8️⃣ Déplacer un utilisateur vers une OU Students
# Créer l'OU si elle n'existe pas
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

# Déplacer l'utilisateur
Move-ADObject -Identity "CN=Karim Niang,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local"

🔟 Connexion à distance avec un utilisateur créé
Add-ADGroupMember -Identity "Remote Desktop Users" -Members "karim.niang"
Get-ADGroupMember "Remote Desktop Users"


