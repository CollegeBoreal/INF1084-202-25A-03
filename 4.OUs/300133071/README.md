# 300133071

# 0️⃣ Nom du domaine basé sur le numéro étudiant

```powershell
$studentNumber = 300133071
$studentInstance = "00"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
```

<img src="images/0.jpg" alt="images" width="450"/>

# 1️⃣ Préparer l’environnement

```powershell
# Importer le module AD
Import-Module ActiveDirectory
# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

<img src="images/1.jpg" alt="images" width="450"/>

# 2️⃣ Liste des utilisateurs du domaine

<img src="images/2.jpg" alt="images" width="450"/>

# 3️⃣ Créer un nouvel utilisateur

```powershell

New-ADUser `
  -Name "William Nelson" `
  -GivenName "William" `
  -Surname "Nelson" `
  -SamAccountName "nelson" `
  -UserPrincipalName "nelson@DC300133071-00.local" `
  -Path "CN=Users,DC=DC300133071-00,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true
```

<img src="images/3.jpg" alt="images" width="450"/>

# 4️⃣ Modifier un utilisateur

<img src="images/4.jpg" alt="images" width="450"/>

# 7️⃣ Supprimer un utilisateur

<img src="images/7.jpg" alt="images" width="450"/>

# 8️⃣ Rechercher des utilisateurs avec un filtre

<img src="images/8.jpg" alt="images" width="450"/>

# 9️⃣ Exporter les utilisateurs dans un CSV

<img src="images/9.jpg" alt="images" width="450"/>

# 🔟 Déplacer un utilisateur vers une OU Students


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
