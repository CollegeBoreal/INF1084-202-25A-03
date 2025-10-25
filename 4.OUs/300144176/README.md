
# 0️⃣ Nom du domaine basé sur le numéro étudiant

```powershell
$studentNumber = 300144176
$studentInstance = "01"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# 1️⃣ Préparer l’environnement

powershell
Import-Module ActiveDirectory

# 2️⃣ Liste des utilisateurs du domaine
# Vérifier le domaine et le contrôleur
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

# 3️⃣ Créer un nouvel utilisateur

Get-ADUser -Filter * | Select-Object Name, SamAccountName


  New-ADUser `
  -Name "Alice" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice" `
  -UserPrincipalName "alice@$domainName" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=$netbiosName,DC=local" `
  -Credential $cred
# 4️⃣ Modifier un utilisateur
Set-ADUser -Identity "alice" `
  -EmailAddress "alice@exemple.com" `
  -GivenName "Alice-Marie" `
  -Credential $cred
# 7️⃣ Supprimer un utilisateur
Disable-ADAccount -Identity "alice" -Credential $cred
# 8️⃣ Rechercher des utilisateurs avec un filtre

Enable-ADAccount -Identity "alice" -Credential $cred
# 9️⃣ Exporter les utilisateurs dans un CSV
Remove-ADUser -Identity "alice" -Confirm:$false -Credential $cred
# 🔟 Déplacer un utilisateur vers une OU Students
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

1️⃣ verifier que la connexion RDP actif
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
2️⃣ activer RDP si c'est desactiv
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

Move-ADObject -Identity "CN=Alice,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred
4️⃣ ouvrir l'executer avec 🪟➕```R``` puis

```txt

              Get-ADUser -Identity "alice" | Select-Object Name, DistinguishedName




