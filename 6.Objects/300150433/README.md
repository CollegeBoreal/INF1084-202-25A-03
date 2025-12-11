# 🧠 Laboratoire Active Directory : Objets gérables et GPO

## 👤 Étudiant

* **Nom :** Djellouli
* **Prénom :** Zakaria
* **ID :** 300150433

---

# 🌐 Sujet du laboratoire

**Titre :** Objets gérables par Active Directory et automatisation via GPO

Ce laboratoire consiste à :

* Manipuler les objets Active Directory (utilisateurs, groupes, OU, dossiers partagés)
* Automatiser la configuration réseau avec des **GPO**
* Configurer un accès **RDP sécurisé**
* Tester les droits des utilisateurs dans l’OU *Students*

---

# 🎯 Objectifs pédagogiques

* ✔ Comprendre les objets AD (User, Group, OU, Computer, Share)
* ✔ Créer un partage réseau accessible uniquement par un groupe spécifique
* ✔ Créer une GPO pour mapper automatiquement un lecteur réseau
* ✔ Autoriser l’accès RDP pour un groupe AD
* ✔ Tester depuis une machine cliente

---

# 🧩 Environnement

* **Windows Server 2022**
* Rôle **Active Directory Domain Services** installé
* **Module PowerShell ActiveDirectory**
* Domaine : `DC300150433-00.local`

---

# 🏗️ Scripts utilisés dans le laboratoire

Les scripts ci-dessous correspondent exactement à ceux exécutés durant le laboratoire.

---

# 📜 1️⃣ Script : Création du dossier partagé + Groupe + Utilisateurs

**Fichier : `utilisateurs1.ps1`**

```powershell
# Chemin du dossier
$SharedFolder = "C:\SharedResources"

# Créer le dossier
New-Item -Path $SharedFolder -ItemType Directory -Force

# Nom du groupe AD
$GroupName = "Students"

# Créer le groupe AD
New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"

# Créer des utilisateurs AD et les ajouter au groupe
$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user `
               -SamAccountName $user `
               -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
               -Enabled $true
    Add-ADGroupMember -Identity $GroupName -Members $user
}

# Partager le dossier avec le groupe
New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
```
on fais la verification :
<img width="793" height="626" alt="1" src="https://github.com/user-attachments/assets/6055b396-8952-4a2c-aa35-fab4873670c1" />
<img width="1011" height="479" alt="2" src="https://github.com/user-attachments/assets/eeb886bc-6832-4b43-ae9b-1f70ecf42716" />

---

# 📜 2️⃣ Script : Création de la GPO + Mapping du lecteur réseau

**Fichier : `utilisateurs2.ps1`**

```powershell
## Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO
New-GPO -Name $GPOName

# Lier la GPO à une OU spécifique (ex: "Students")
$OU = "OU=Students,DC=DC300150433-50,DC=local"
New-GPLink -Name $GPOName -Target $OU

# Créer une préférence pour mapper le lecteur réseau
$DriveLetter = "Z:"
$SharePath = "\\DC300150433-50\SharedResources"

# Créer un script logon
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"
if (-not (Test-Path $ScriptFolder)) { New-Item -ItemType Directory -Path $ScriptFolder }

$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent

# Lier le script logon à la GPO
Set-GPRegistryValue -Name $GPOName `
                    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
                    -ValueName "LogonScript" `
                    -Type String `
                    -Value $ScriptPath
```
on fais la verification :
<img width="1032" height="224" alt="3" src="https://github.com/user-attachments/assets/452c2d7e-1ee7-4404-8a74-100cf8d9c102" />

---

# 📜 3️⃣ Script : Activation du RDP pour le groupe Students

**Fichier : `utilisateurs3.ps1`**

```powershell
# Autoriser RDP sur la machine
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Autoriser le firewall RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Donner le droit logon via RDP au groupe Students
secedit /export /cfg C:\secpol.cfg
# Modifier le fichier pour inclure Students dans "SeRemoteInteractiveLogonRight"
# Puis réimporter
secedit /import /cfg C:\secpol.cfg /db C:\secpol.sdb /overwrite
```
on fais la verification :
<img width="760" height="54" alt="4" src="https://github.com/user-attachments/assets/f45c9ca4-07e6-41cd-80d7-f1c94dfe5ee2" />


---

# 🧪 Vérifications effectuées

| Test                                                | Résultat                                       |
| --------------------------------------------------- | ---------------------------------------------- |
| Connexion avec Etudiant1 / Etudiant2                | ✔ Connecte au domaine                          |
| Mapping du lecteur Z: via GPO                       | ✔ Le lecteur apparaît automatiquement          |
| Accès au partage `\\DC300150433-00\SharedResources` | ✔ Autorisé uniquement au groupe Students       |
| Accès RDP                                           | ✔ Réussi pour Students, refusé pour les autres |
| Vérification des GPO appliquées                     | ✔ `gpresult /r` confirme l’application         |

---

# 📁 Structure du dépôt

```
300150433/
├── README.md
├── utilisateurs1.ps1
├── utilisateurs2.ps1
├── utilisateurs3.ps1
├── images/
│   └── .gitkeep
```

---
