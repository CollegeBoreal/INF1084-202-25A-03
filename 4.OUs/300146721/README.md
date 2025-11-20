## 300146721

# 0️⃣ Nom du domaine basé sur le numéro étudiant

```powershell
$studentNumber = 300146721
$studentInstance = "001"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
```

# 1️⃣ Préparer l’environnement

```powershell
# Importer le module Active Directory
Import-Module ActiveDirectory

# Vérifier le domaine et les contrôleurs de domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```


# 3️⃣ Créer un nouvel utilisateur

```powershell

New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300146721-001.local" `
  -Path "CN=Users,DC=DC300146721-001,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true
```


# 4️⃣ Modifier un utilisateur
```powershell
Set-ADUser -Identity "alice.dupont" `
  -EmailAddress "alice.dupont@exemple.com" `
  -GivenName "Alice-Marie"

```

# 7️⃣ Supprimer un utilisateur
```powershell
Remove-ADUser -Identity "alice.dupont" -Confirm:$false
```

# 8️⃣ Rechercher des utilisateurs avec un filtre
```powershell
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

```
# 9️⃣ Exporter les utilisateurs dans un CSV
```powershell
Get-ADUser -Filter * -Server $domainName -Properties Name,SamAccountName,EmailAddress,Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name,SamAccountName,EmailAddress,Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

```

# 🔟 Déplacer un utilisateur vers une OU Students
```powershell
Move-ADObject `
  -Identity "CN=Alice Dupont,CN=Users,DC=DC300146721-001,DC=local" `
  -TargetPath "OU=Students,DC=DC300146721-001,DC=local"
```

# 🉐 Pour vous connecter avec un utilisateur creer vous devez :

1️⃣ verifier que la connexion RDP actif

```powershell
(Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections).fDenyTSConnections
```
```txt
1 c'est desactive 0 c'est active
```
2️⃣ activer RDP si c'est desactiver

```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
```
3️⃣ ajouter votre utilisateur dans le groupe remote desktop users

```powershell
Add-ADGroupMember -Identity "Remote Desktop Users" -Members "wnelson"
```
```powershell
Get-ADGroupMember "Remote Desktop Users"
```
4️⃣ ouvrir l'executer avec 🪟➕```R``` puis

```txt
taoe secpol.msc (→ menu Démarrer → tape secpol.msc)

allez dans :
Local Policies → User Rights Assignment → Allow log on through Remote Desktop Services

Assure-toi que le groupe Remote Desktop Users (et/ou ton utilisateur) y figure.
```
