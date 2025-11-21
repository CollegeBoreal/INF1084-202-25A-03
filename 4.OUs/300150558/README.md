
---

# 📄 **README – Gestion des utilisateurs Active Directory (INF1084)**

**Étudiante : Amira Sadouni**
**Numéro étudiant : 300150558**

---

## 🎯 **Objectif du TP**

Ce travail pratique vise à configurer un environnement Active Directory dans une machine virtuelle Windows Server, puis à automatiser la gestion des utilisateurs via PowerShell.

L’étudiante devra :

* Cloner le dépôt du cours
* Configurer ses variables d’environnement
* Créer et gérer des utilisateurs AD
* Déplacer des objets vers une OU dédiée
* Exporter des informations du domaine

---

## 🗂️ **1. Préparation de l’environnement**

### 📌 Cloner le cours sur votre machine virtuelle

Dans PowerShell, exécuter :

```powershell
cd $HOME
mkdir Developer
cd Developer

git clone https://github.com/CollegeBoreal/INF1084-202-25A-03.git
```

Le répertoire suivant doit obligatoirement exister :

```
~/Developer/INF1084-202-25A-03
```

---

## 🌐 **2. Configuration du domaine**

Chaque étudiant possède un domaine unique basé sur son numéro étudiant.

### 🔧 Variables principales

```powershell
# Vos informations
$studentNumber = 300150558
$studentInstance = 0

# Noms générés automatiquement
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
```

Exemples :

* **FQDN** : `DC300150558-0.local`
* **NetBIOS** : `DC300150558-0`

---

## 🔐 **3. Informations d’authentification**

Créer un fichier `bootstrap.ps1` contenant :

```powershell
# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential(
    "Administrator@$domainName",
    $secure
)
```

Ou demander manuellement les identifiants :

```powershell
$cred = Get-Credential
```

---

## 🛠️ **4. Vérification du domaine**

Importer le module Active Directory :

```powershell
Import-Module ActiveDirectory
```

Vérifier le domaine et le contrôleur de domaine :

```powershell
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

---

## 👥 **5. Lister les utilisateurs du domaine**

```powershell
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```

---

## ➕ **6. Créer un nouvel utilisateur**

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

---

## 📝 **7. Modifier un utilisateur**

```powershell
Set-ADUser -Identity "alice.dupont" `
           -GivenName "Alice-Marie" `
           -EmailAddress "alice.dupont@exemple.com" `
           -Credential $cred
```

---

## ⛔ **8. Désactiver / 🔓 Réactiver un utilisateur**

```powershell
Disable-ADAccount -Identity "alice.dupont" -Credential $cred
Enable-ADAccount  -Identity "alice.dupont" -Credential $cred
```

---

## 🗑️ **9. Supprimer un utilisateur**

```powershell
Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred
```

---

## 🔍 **10. Rechercher des utilisateurs**

```powershell
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
```

---

## 📤 **11. Exporter les utilisateurs vers un CSV**

```powershell
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
```

---

## 🧩 **12. Déplacer un utilisateur vers l’OU Students**

### Créer l’OU (si elle n’existe pas)

```powershell
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}
```

### Déplacer l’utilisateur

```powershell
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred
```

---

## 🧾 **Bilan du TP**

À la fin de ce travail, l’étudiante Amira Sadouni maîtrise :

* La création et la gestion des utilisateurs AD via PowerShell
* Les filtres et requêtes Active Directory
* Les opérations d’activation/désactivation
* Le déplacement d’objets AD dans des OU personnalisées
* L’exportation des données du domaine

Ce TP démontre une bonne compréhension de l’automatisation AD et du fonctionnement du domaine Windows Server.

---


