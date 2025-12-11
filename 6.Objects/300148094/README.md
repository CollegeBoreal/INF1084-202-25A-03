# 🧠 Laboratoire Active Directory : Objets gérables et GPO

👤 **Étudiant**  
Nom : **Gacem**  
Prénom : **Ouail**  
ID Étudiant : **300148094**

---

## 🌐 Sujet du laboratoire  
**Titre :** Objets gérables par Active Directory et automatisation via GPO (Group Policy Object)

Ce laboratoire consiste à :  
- Manipuler les objets Active Directory (utilisateurs, groupes, OU).  
- Créer un partage réseau SMB sécurisé.  
- Automatiser le mappage réseau via GPO.  
- Activer l’accès RDP pour un groupe AD.  
- Déployer des stratégies de groupe via PowerShell.

---

## 🎯 Objectifs
- Comprendre les objets AD et comment les gérer.  
- Créer et partager un dossier réseau sécuritaire.  
- Créer des utilisateurs et groupes Active Directory.  
- Mapper automatiquement un lecteur réseau (Z:).  
- Autoriser l’accès RDP seulement à un groupe spécifique.  
- Tester et valider les permissions.

---

## 🧩 Environnement requis
- Windows Server 2022 avec **AD DS**  
- Modules PowerShell : **ActiveDirectory**, **GroupPolicy**  
- Une machine cliente membre du domaine  
- Domaine : **DC300148094-00.local**  
- OU utilisée : **Students**

---

# 🏗️ Étapes du laboratoire

---

## 1️⃣ **Création de l'OU, du groupe et des utilisateurs (utilisateurs1.ps1)**

```powershell
# === 1. CRÉATION DE L'OU STUDENTS ===
$OUPath = "OU=Students,DC=DC300148094-00,DC=local"

if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=DC300148094-00,DC=local"
}

# === 2. CRÉATION DU GROUPE STUDENTS ===
$GroupName = "Students"

if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Groupe d'étudiants" -Path $OUPath
}

# === 3. CRÉATION DES UTILISATEURS ===
$Users = @("Etudiant1", "Etudiant2")

foreach ($user in $Users) {

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name $user `
            -SamAccountName $user `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true `
            -Path $OUPath
    }

    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}
2️⃣ Création du GPO pour mapper le lecteur réseau (utilisateurs2.ps1)
powershell
Copier le code
## Nom de la GPO
$GPOName = "MapSharedFolder"

# === 1. Créer l'OU Students SI ELLE N'EXISTE PAS ===
$OUPath = "OU=Students,DC=DC300148094-00,DC=local"

if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=DC300148094-00,DC=local"
}

# === 2. Créer la GPO ===
New-GPO -Name $GPOName -ErrorAction SilentlyContinue

# === 3. Lier la GPO à l'OU ===
Remove-GPLink -Name $GPOName -Target $OUPath -Confirm:$false -ErrorAction SilentlyContinue
New-GPLink -Name $GPOName -Target $OUPath

# === 4. Préférences pour mapper le lecteur réseau ===
$DriveLetter = "Z:"
$SharePath = "\\DC300148094-00\SharedResources"

# === 5. Créer le script logon ===
$ScriptFolder = "C:\Scripts"
$ScriptPath   = "$ScriptFolder\MapDrive-$DriveLetter.bat"

if (-not (Test-Path $ScriptFolder)) { New-Item -ItemType Directory -Path $ScriptFolder }

"net use $DriveLetter $SharePath /persistent:no" | Set-Content $ScriptPath

# === 6. Lier le script à la GPO ===
Set-GPRegistryValue -Name $GPOName `
                    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
                    -ValueName "LogonScript" `
                    -Type String `
                    -Value $ScriptPath
3️⃣ Création du partage SMB + activation RDP (utilisateurs3.ps1)
powershell
Copier le code
# === 1. CRÉATION DU DOSSIER ET DU PARTAGE ===
$SharedFolder = "C:\SharedResources"

if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory | Out-Null
}

# Permissions NTFS
icacls $SharedFolder /grant "Students:(OI)(CI)F" /T | Out-Null

# SMB Share
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess "Students"
}

########## 2. ACTIVATION RDP ##########
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Donner droits RDP
$group = "Students"
$cfgPath = "$env:TEMP\secpol.cfg"
$dbPath  = "$env:TEMP\secpol.sdb"

secedit /export /cfg $cfgPath /areas USER_RIGHTS | Out-Null
$content = Get-Content $cfgPath
$matchLine = $content | Select-String "^SeRemoteInteractiveLogonRight"

if ($matchLine) {
    $index = $content.IndexOf($matchLine.Line)
    if ($matchLine.Line -notmatch "\*$group") {
        $content[$index] = $matchLine.Line + ",*$group"
    }
} else {
    Add-Content -Path $cfgPath -Value "SeRemoteInteractiveLogonRight = *Students"
}

$content | Set-Content $cfgPath
secedit /configure /db $dbPath /cfg $cfgPath /areas USER_RIGHTS | Out-Null

Write-Host "RDP activé et droits appliqués pour le groupe Students."
✅ Vérifications
✔ Connexion avec Etudiant1 ou Etudiant2
Le lecteur Z: est mappé vers \\DC300148094-00\SharedResources

L’accès RDP est autorisé

✔ Connexion avec un utilisateur NON membre de Students
Pas d’accès RDP

Aucun lecteur mappé

📘 Commandes PowerShell utiles
Action	Commande
Lister toutes les GPO	Get-GPO -All
Afficher une GPO	Get-GPO -Name "MapSharedFolder"
Lier une GPO à une OU	New-GPLink -Name "MapSharedFolder" -Target "OU=Students,DC=..."
Lister utilisateurs	Get-ADUser -Filter *

💡 Points d’apprentissage
Administration avancée d’Active Directory

Automatisation PowerShell

GPO et déploiement centralisé

Gestion de permissions SMB

Activation et sécurité RDP

📁 Structure du dépôt
markdown
Copier le code
300148094/
│── README.md
│── utilisateurs1.ps1
│── utilisateurs2.ps1
│── utilisateurs3.ps1

🧾 Conclusion
Ce laboratoire m’a permis de comprendre en profondeur :

La gestion des objets Active Directory

L’automatisation via PowerShell

Le déploiement de stratégies de groupe

La configuration d’un partage réseau sécurisé

Le contrôle des accès RDP selon les groupes AD
