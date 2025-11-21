## Laboratoire Active Directory : Objets gérables et GPO

## Étudiante
- **Nom :** Hocine  
- **Prénom :** Sara  
- **ID Étudiant :** 300151347 

---

## Sujet du laboratoire
**Titre :** Objets gérables par Active Directory et automatisation via GPO (Group Policy Object)

Ce laboratoire vise à manipuler les principaux objets Active Directory (utilisateurs, groupes, OU, ordinateurs, etc.) et à automatiser la gestion des ressources réseau à l’aide de PowerShell et des GPO.

---

## Objectifs
- Comprendre les objets AD et leur utilité  
- Créer et partager un dossier réseau SMB  
- Créer des utilisateurs et groupes AD  
- Mapper un lecteur réseau (Z:) via un GPO  
- Activer le RDP pour un groupe spécifique  
- Tester les accès et  Environnement requis

## Environnement requis 
- Windows Server 2022 avec AD DS installé  
- Modules PowerShell : ActiveDirectory, GroupPolicy  
- VM membre du domaine pour les tests  
- Domaine : **DC300151347-00.local**  
- OU : **Students**

---
##Étapes du laboratoire 

## 1️⃣ Création du dossier partagé et du groupe AD
```powershell
$SharedFolder = "C:\SharedResources"
New-Item -Path $SharedFolder -ItemType Directory -Force

$GroupName = "Students"
New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"

$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user -SamAccountName $user -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) -Enabled $true
    Add-ADGroupMember -Identity $GroupName -Members $user
}

New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
```
---
## 2️⃣ Création du GPO pour mapper le lecteur réseau

```powershell
$GPOName = "MapSharedFolder"
New-GPO -Name $GPOName

$OU = "OU=Students,DC=DC300151347-00,DC=local"
New-GPLink -Name $GPOName -Target $OU

$DriveLetter = "Z:"
$SharePath = "\\DC300151347-00\SharedResources"

$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

if (-not (Test-Path $ScriptFolder)) { New-Item -ItemType Directory -Path $ScriptFolder }

$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent

Set-GPRegistryValue -Name $GPOName `
                    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
                    -ValueName "LogonScript" `
                    -Type String `
                    -Value $ScriptPath
```
---
## 3️⃣ Activation du RDP pour le groupe Students

```powershell
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

secedit /export /cfg C:\secpol.cfg
# Ajouter "Students" à SeRemoteInteractiveLogonRight
secedit /import /cfg C:\secpol.cfg /db C:\secpol.sdb /overwrite
```
---

# ✅ Vérifications

### ✔ Connexion avec Etudiant1 ou Etudiant2 :
- Le lecteur Z: est mappé vers :  
  `\\DC300151347-00\SharedResources`  
- Le RDP fonctionne  

### ❌ Connexion avec un utilisateur hors du groupe :
- Pas d’accès RDP  
- Aucun lecteur réseau  Commandes PowerShell utiles

---
# Commandes Pwershell utiles

| Action | Commande |
|--------|----------|
| Lister toutes les GPO | `Get-GPO -All` |
| Afficher une GPO spécifique | `Get-GPO -Name "MapSharedFolder"` |
| Lier une GPO à une OU | `New-GPLink -Name "MapSharedFolder" -Target "OU=Students,DC=..."` |mappé
  
---
# Points d<apprentissage 
 
- Administration d’Active Directory via PowerShell  
- Création et gestion centralisée des objets AD  
- Déploiement automatisé des ressources via GPO  
- Sécurisation des accès avec les groupes AD et RDP  
- Validation des stratégies dans un environnement de domaine  
        
---

# Structure du depot
```
300151347/
├── README.md
├── utilisateurs1.ps1
├── utilisateurs2.ps1
├── utilisateurs3.ps1
└── images/
    └── .gitkeep
```

---

# Conclusion
Ce laboratoire m’a permis de maîtriser la gestion des objets Active Directory et l’automatisation des tâches administratives via PowerShell et GPO.  
J’ai pu mettre en pratique la création d’un partage réseau, la configuration d’un GPO, ainsi que l’accès distant (RDP) dans un environnement Active Directory complet.
