# 🧠 Laboratoire Active Directory : Objets gérables et GPO

## 👤 Étudiant
- **Nom :** Souyadi  
- **Prénom :** Hachem  
- **ID Étudiant :** 300150416  

---

## 🌐 Sujet du laboratoire
**Titre :** Objets gérables par Active Directory et automatisation via GPO (Group Policy Object)  
Ce laboratoire vise à manipuler les principaux objets Active Directory (utilisateurs, groupes, OU, ordinateurs, etc.) et à automatiser la gestion des ressources réseau à l’aide de PowerShell et des GPO.

---

## 🎯 Objectifs
1. Comprendre les objets AD et leur utilité.  
2. Créer et partager un dossier réseau SMB.  
3. Créer des utilisateurs et groupes AD.  
4. Mapper un lecteur réseau (Z:) via un GPO.  
5. Activer le RDP pour un groupe spécifique.  
6. Tester les accès et permissions.

---

## 🧩 Environnement requis
- Windows Server 2022 avec AD DS installé  
- Modules PowerShell : `ActiveDirectory`, `GroupPolicy`  
- VM membre du domaine pour les tests  
- Domaine : `DC300150416-00.local`  
- OU : `Students`  

---

## 🏗️ Étapes du laboratoire

### 1️⃣ Création du dossier partagé et du groupe AD
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
2️⃣ Création du GPO pour mapper le lecteur réseau
powershell
Copy code
$GPOName = "MapSharedFolder"
New-GPO -Name $GPOName

$OU = "OU=Students,DC=DC300150416-00,DC=local"
New-GPLink -Name $GPOName -Target $OU

$DriveLetter = "Z:"
$SharePath = "\\DC300150416-00\SharedResources"

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
3️⃣ Activation du RDP pour le groupe Students
powershell
Copy code
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
secedit /export /cfg C:\secpol.cfg
# Ajouter "Students" à SeRemoteInteractiveLogonRight
secedit /import /cfg C:\secpol.cfg /db C:\secpol.sdb /overwrite
✅ Vérifications
Connexion avec Etudiant1 ou Etudiant2 :

Le lecteur Z: est mappé vers \\DC300150416-00\SharedResources

L’accès RDP est autorisé

Connexion avec un utilisateur hors du groupe :

Pas d’accès RDP

Aucun lecteur réseau mappé

📘 Commandes PowerShell utiles
Action	Commande
Lister toutes les GPO	Get-GPO -All
Afficher une GPO spécifique	Get-GPO -Name "MapSharedFolder"
Lier une GPO à une OU	New-GPLink -Name "MapSharedFolder" -Target "OU=Students,DC=..."

💡 Points d’apprentissage
Administration d’Active Directory via PowerShell

Création et gestion centralisée des objets AD

Déploiement automatisé des ressources via GPO

Sécurisation des accès avec les groupes et RDP

📁 Structure du dépôt
bash
Copy code
300150416/
├── README.md
├── utilisateurs1.ps1
├── utilisateurs2.ps1
├── images/
│   └── .gitkeep
🧾 Conclusion
Ce laboratoire m’a permis de maîtriser la gestion des objets Active Directory et l’automatisation des tâches administratives via PowerShell et GPO. J’ai pu mettre en pratique la création d’un partage réseau, la configuration de stratégies de groupe et l’accès distant (RDP) en environnement de domaine.

📅 Date de réalisation : (à compléter)
🧑‍💻 Réalisation : Hachem Souyadi — 300150416