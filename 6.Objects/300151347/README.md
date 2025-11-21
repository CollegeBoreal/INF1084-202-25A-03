##############################################################
#        LABORATOIRE ACTIVE DIRECTORY – OBJETS AD & GPO      #
##############################################################

==============================================================
                    1. INFORMATIONS ÉTUDIANTE
==============================================================

Nom      : Hocine
Prénom   : Sara
ID       : 300151347
Cours    : INF1084 – Administration des systèmes
Session  : 2025


==============================================================
                    2. SUJET DU LABORATOIRE
==============================================================

Ce laboratoire porte sur :

- La gestion des objets Active Directory (utilisateurs, groupes, OU, PC).
- La création d’un dossier partagé (SMB).
- L’automatisation de la gestion AD avec PowerShell.
- La création d’une GPO pour mapper automatiquement le lecteur Z:.
- L'activation du RDP pour un groupe d'utilisateurs.
- Les tests sur une VM membre du domaine.


==============================================================
                     3. OBJECTIFS DU LABO
==============================================================

1. Comprendre les objets AD.
2. Créer un dossier partagé accessible au groupe Students.
3. Créer des utilisateurs via PowerShell.
4. Mapper automatiquement un lecteur réseau (Z:).
5. Activer le RDP pour un groupe AD.
6. Vérifier l'application des GPO sur une VM cliente.


==============================================================
                4. ENVIRONNEMENT ET PRÉ-REQUIS
==============================================================

- Windows Server 2022 avec AD DS.
- Modules PowerShell : ActiveDirectory, GroupPolicy.
- VM cliente jointe au domaine.
- Domaine : DC300151347-00.local
- OU utilisée : Students


==============================================================
     5. SCRIPT 1 : CRÉATION DU DOSSIER PARTAGÉ + UTILISATEURS
==============================================================

```powershell
$SharedFolder = "C:\SharedResources"
New-Item -Path $SharedFolder -ItemType Directory -Force

$GroupName = "Students"
New-ADGroup -Name $GroupName -GroupScope Global `
-Description "Users allowed RDP and shared folder access"

$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user -SamAccountName $user `
    -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
    -Enabled $true

    Add-ADGroupMember -Identity $GroupName -Members $user
}

New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
==============================================================
6. SCRIPT 2 : CRÉATION DE LA GPO (MAPPING DRIVE Z:)
powershell
Copier le code
$GPOName = "MapSharedFolder"
New-GPO -Name $GPOName

$OU = "OU=Students,DC=DC300151347-00,DC=local"
New-GPLink -Name $GPOName -Target $OU

$DriveLetter = "Z:"
$SharePath = "\\DC300151347-00\SharedResources"

$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder
}

$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent

Set-GPRegistryValue -Name $GPOName `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
-ValueName "LogonScript" -Type String -Value $ScriptPath
==============================================================
7. SCRIPT 3 : ACTIVATION DU RDP POUR LE GROUPE
powershell
Copier le code
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
-Name "fDenyTSConnections" -Value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

secedit /export /cfg C:\secpol.cfg
# Modifier le fichier pour inclure Students dans SeRemoteInteractiveLogonRight
secedit /import /cfg C:\secpol.cfg /db C:\secpol.sdb /overwrite
==============================================================
8. TESTS
UTILISATEURS : Etudiant1 / Etudiant2 (membres de Students)
✔ Le lecteur Z: apparaît automatiquement
✔ Le dossier partagé est accessible
✔ Le RDP fonctionne

UTILISATEUR NON MEMBRE DU GROUPE
✘ Aucun lecteur Z:
✘ Pas d’accès RDP

==============================================================
9. COMMANDES POWERSHELL UTILES
Lister les GPO :
Get-GPO -All

Voir une GPO :
Get-GPO -Name "MapSharedFolder"

Lier une GPO à une OU :
New-GPLink -Name "MapSharedFolder" -Target "OU=Students,DC=..."

Lister utilisateurs :
Get-ADUser -Filter *

Lister groupes :
Get-ADGroup -Filter *

==============================================================
10. CONCLUSION
Ce laboratoire m’a permis de comprendre le fonctionnement des objets AD et
l’automatisation de tâches via PowerShell et GPO.

L’utilisation combinée des scripts et des stratégies rend l’administration
Windows plus efficace, centralisée et sécurisée.    
