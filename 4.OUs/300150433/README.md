# 🧠 TP : Gestion des utilisateurs Active Directory avec PowerShell

**Étudiant : Zakaria Djellouli (300150433)**

---

# 🎯 Objectif du TP

Ce travail avait pour but de manipuler Active Directory à l’aide de **PowerShell uniquement**, sans interface graphique. Les objectifs incluaient :

* Vérifier le fonctionnement du domaine AD
* Créer et gérer des utilisateurs
* Modifier, désactiver, réactiver et supprimer un compte
* Déplacer un utilisateur dans une OU
* Automatiser les tâches AD à l’aide de scripts

---

# 🧩 Étapes réalisées

## 1️⃣ Création de l’environnement

* Clonage du repo du cours
* Création du dossier personnel `300150433`
* Ajout des scripts dans le répertoire `4.OUs/300150433/`

---

## 2️⃣ Configuration du domaine Active Directory

### Domaine généré :

* **Nom du domaine :** `DC300150433-00.local`
* **Nom NetBIOS :** `DC300150433-00`

### Script utilisé (bootstrap) :

```powershell
$studentNumber = 300150433
$studentInstance = 00
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
```

---

# 📜 Scripts PowerShell utilisés

Les scripts ci-dessous ont été exécutés dans l’ordre pour gérer le domaine et les utilisateurs.

---

# ▶ **utilisateurs1.ps1 — Vérification du domaine et du DC**

```powershell
Import-Module ActiveDirectory

$domainName = "dc300150433-00.local"

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

---

# ▶ **utilisateurs2.ps1 — Liste des utilisateurs actifs**

```powershell
$domainName = "dc300150433-00.local"

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```

---

# ▶ **utilisateurs3.ps1 — Création de l'utilisateur Alice Dupont**

```powershell
$domainName = "DC300150433-00.local"

New-ADUser -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@$domainName" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=DC300150433-00,DC=local"
```

---

# ▶ **utilisateurs4.ps1 — Modification de l’utilisateur**

```powershell
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie"
```

---

# ▶ **utilisateurs5.ps1 — Désactivation, Réactivation, Suppression, Liste**

```powershell
Import-Module ActiveDirectory

$domainName = "dc300150433-00.local"

# Désactiver Alice
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Activer Alice
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer Alice
Remove-ADUser -Identity "alice.dupont" -Server $domainName -Confirm:$false

# Rechercher les utilisateurs commençant par 'a'
Get-ADUser -Filter "Name -like 'a*'" -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName

# Lister tous les utilisateurs
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName
```

---

# ▶ **utilisateurs6.ps1 — Déplacement de l'utilisateur dans l’OU Students**

```powershell
$domainName = "dc300150433-00.local"

# Récupérer l'OU Students (crée-la avant si elle n'existe pas)
$studentsOU = Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -Server $domainName

# Récupérer Alice
$user = Get-ADUser -Identity "alice.dupont" -Server $domainName -Properties DistinguishedName

# Déplacer Alice dans Students
Move-ADObject -Identity $user.DistinguishedName -TargetPath $studentsOU.DistinguishedName -Server $domainName

# Vérifier
Get-ADUser -Identity "alice.dupont" -Server $domainName | Select Name, DistinguishedName
```

---

# 📦 Structure du projet

```
INF1084-202-25A-03/
├── 4.OUs/
│   ├── 300150433/
│   │   ├── README.md
│   │   ├── bootstrap.ps1
│   │   ├── utilisateurs1.ps1
│   │   ├── utilisateurs2.ps1
│   │   ├── utilisateurs3.ps1
│   │   ├── utilisateurs4.ps1
│   │   ├── utilisateurs5.ps1
│   │   ├── utilisateurs6.ps1
│   │   └── images/
│   │       └── .gitkeep
```

---

# 🧾 Conclusion

Ce TP m’a permis de :

* Comprendre les concepts clés d’Active Directory
* Manipuler les comptes utilisateurs via PowerShell
* Gérer l’automatisation des tâches d’administration
* Travailler avec les OU, les comptes désactivés et les filtres AD

