# Gestion des Utilisateurs Active Directory avec PowerShell

## 📋 Informations du Projet

**Étudiant:** 300143951  
**Domaine:** DC300143951-0.local  
**NetBIOS:** DC300143951-00

## 🔧 Configuration Initiale

### Fichier `bootstrap.ps1`

Créez ce fichier avec vos informations de connexion :

```powershell
# Informations de l'étudiant
$studentNumber = 300143951
$studentInstance = 0

# Noms du domaine
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Identifiants administrateur
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
```

### Vérification de l'environnement

```powershell
# Importer le module Active Directory
Import-Module ActiveDirectory

# Vérifier le domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

## 👥 Gestion des Utilisateurs

### Lister les utilisateurs actifs

```powershell
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```

### Créer un utilisateur

```powershell
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

### Modifier un utilisateur

```powershell
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred
```

### Désactiver/Réactiver un utilisateur

```powershell
# Désactiver
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

# Réactiver
Enable-ADAccount -Identity "alice.dupont" -Credential $cred
```

### Supprimer un utilisateur

```powershell
Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred
```

### Rechercher des utilisateurs

```powershell
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
```

## 📂 Structure du Projet

```
300143951/
├── README.md
├── bootstrap.ps1
└── images/
    └── .gitkeep
```

## 🚀 Commandes Git

```bash
# Créer la structure
mkdir 300143951
cd 300143951
touch README.md
mkdir images
touch images/.gitkeep

# Envoyer vers le serveur Git
cd ..
git add 300143951
git commit -m "Ajout du projet Active Directory - 300143951"
git push
```

## 📍 Répertoire de Vérification

Le projet doit être cloné dans :
```
~/Developer/INF1084-202-25A-03
```

---

**Cours:** INF1084-202-25A-03  
**Collège Boréal**
