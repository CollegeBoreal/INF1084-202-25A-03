# 300151403

# 0️⃣ Nom du domaine basé sur le numéro étudiant

```powershell
$studentNumber = 300133071
$studentInstance = "00"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
```
<img src="images/0" alt="images" width="450"/>
```powershell
1️⃣ Préparer l’environnement
# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

2️⃣ Liste des utilisateurs du domaine
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
⚠️ Remarque : les utilisateurs créés par défaut sont dans CN=Users, pas dans une OU.

🔑 Pour les operations néscessitant les informations sécurisées de l'administrateur

$cred = Get-Credential  # entrer Administrator@$domainName et le mot de passe

3️⃣ Créer un nouvel utilisateur
New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred
           
  4️⃣ Modifier un utilisateur
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred
5️⃣ Désactiver un utilisateur
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

6️⃣ Réactiver un utilisateur
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

7️⃣ Supprimer un utilisateur
Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

8️⃣ Rechercher des utilisateurs avec un filtre
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

9️⃣ Exporter les utilisateurs dans un CSV
Get-ADUser -Filter * -Server $domain -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

1️⃣ 0️⃣ Déplacer un utilisateur vers une OU Students
Crée l’OU si elle n’existe pas :
# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}
Déplacer l’utilisateur depuis CN=Users :
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred
Vérifier le déplacement :
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName
