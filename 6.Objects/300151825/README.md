# 300151825

Laboratoire: Partage de ressources et RDP via PowerShell

```powershell
 Créer un répertoire avec ton 🆔 (votre identifiant boreal)
 mkdir  🆔
 cd  🆔
 dans le répertoire ajouter le fichier README.md
 touch README.md
 Créer un répertoire images
 mkdir images
 touch images/.gitkeep
 envoyer vers le serveur git
 remonter au repertoire précédent
 cd ..
 git add 🆔
 git commit -m "mon fichier ..."
 git push
```
---

 1️⃣ Pré-requis
```powershell
 DC Windows Server 2022 avec AD DS installé
Module Active Directory disponible (Import-Module ActiveDirectory)
Module GroupPolicy disponible (Import-Module GroupPolicy)
VM membre pour tester le partage et RDP
 Utiliser le fichier 4.OUs/bootstrap.ps1 concernant vos informations. (utiliser dot-sourcing )
```

 2️⃣ Créer le dossier partagé
 utilisateurs1.ps1
```powershell
 # Chemin du dossier
$SharedFolder = "C:\SharedResources"

# Créer le dossier
New-Item -Path $SharedFolder -ItemType Directory -Force

# Créer un partage SMB pour le groupe Students
$GroupName = "Students"

# Créer le groupe AD
New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"

# Créer des utilisateurs AD et les ajouter au groupe
$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user -SamAccountName $user -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) -Enabled $true
    Add-ADGroupMember -Identity $GroupName -Members $user
}

# Partager le dossier avec le groupe
New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
```
---

3️⃣ Créer une GPO pour mapper le lecteur réseau

utilisateurs2.ps1
```powershell
# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO
New-GPO -Name $GPOName

# Lier la GPO à une OU spécifique (ex: "Students")
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU

# Créer une preference pour mapper le lecteur réseau
$DriveLetter = "Z:"
$SharePath = "\\$netbiosName\SharedResources"

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
---

4️⃣ Activer RDP pour le groupe
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
Astuce : on peut aussi utiliser ntrights.exe du Resource Kit pour assigner RDP à un groupe via PowerShell.

---

5️⃣ Test
```powershell
1. Connecte-toi avec un des utilisateurs du groupe Students
2. Vérifie que :
  Le lecteur réseau Z: est mappé automatiquement
  L’utilisateur peut se connecter en RDP
3. Essaye un utilisateur hors du groupe → il ne doit pas avoir accès.
```
---

```powershell
J'ai verifié que :
.Les étudiants manipulent AD, GPO, RDP, SMB uniquement via PowerShell
.Aucun besoin d’interface graphique
.Tout peut être reproduit sur Hyper-V pour plusieurs VMs
```
