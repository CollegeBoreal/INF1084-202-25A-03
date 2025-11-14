# Script de configuration Active Directory
# Création d'utilisateurs, groupes, partages et GPO

# Variables de configuration
$DomainName = (Get-ADDomain).DNSRoot
$ServerName = $env:COMPUTERNAME
$OUPath = "OU=Students,DC=" + ($DomainName -replace '\.', ',DC=')
$GroupName = "Students"
$SharedFolderPath = "C:\Users\Administrator\Developper\INF1084-202-25A-03\6.Objects\300151403\SharedResources"
$ShareName = "SharedResources"
$SysvolPath = "\\$DomainName\SYSVOL\$DomainName"
$SysvolScripts = "$SysvolPath\scripts"

# Fonction pour créer une OU si elle n'existe pas
function Create-OUIfNotExists {
    param([string]$Name, [string]$Path)
    
    try {
        $ouPath = "OU=$Name,$Path"
        Get-ADOrganizationalUnit -Identity $ouPath -ErrorAction Stop | Out-Null
        Write-Host "L'OU $Name existe déjà" -ForegroundColor Yellow
    }
    catch {
        New-ADOrganizationalUnit -Name $Name -Path $Path
        Write-Host "OU créée : $Name" -ForegroundColor Green
    }
}

# Fonction pour créer un groupe si il n'existe pas
function Create-GroupIfNotExists {
    param([string]$Name, [string]$Path)
    
    try {
        Get-ADGroup -Identity $Name -ErrorAction Stop | Out-Null
        Write-Host "Le groupe $Name existe déjà" -ForegroundColor Yellow
    }
    catch {
        New-ADGroup -Name $Name -GroupScope Global -Path $Path
        Write-Host "Groupe créé : $Name" -ForegroundColor Green
    }
}

# Fonction pour créer un utilisateur si il n'existe pas
function Create-UserIfNotExists {
    param(
        [string]$Username,
        [string]$Password,
        [string]$Path
    )
    
    try {
        Get-ADUser -Identity $Username -ErrorAction Stop | Out-Null
        Write-Host "L'utilisateur $Username existe déjà" -ForegroundColor Yellow
    }
    catch {
        $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
        New-ADUser -Name $Username `
                   -SamAccountName $Username `
                   -UserPrincipalName "$Username@$DomainName" `
                   -Path $Path `
                   -AccountPassword $SecurePassword `
                   -Enabled $true `
                   -PasswordNeverExpires $true
        Write-Host "Utilisateur créé : $Username" -ForegroundColor Green
    }
}

# 1. Créer l'OU Students si elle n'existe pas
$DomainDN = (Get-ADDomain).DistinguishedName
Create-OUIfNotExists -Name "Students" -Path $DomainDN

# 2. Créer le groupe Students
Create-GroupIfNotExists -Name $GroupName -Path $OUPath

# 3. Créer les utilisateurs
Create-UserIfNotExists -Username "Etudiant1" -Password "Password123!" -Path $OUPath
Create-UserIfNotExists -Username "Etudiant2" -Password "Password123!" -Path $OUPath

# 4. Ajouter les utilisateurs au groupe
try {
    Add-ADGroupMember -Identity $GroupName -Members "Etudiant1" -ErrorAction Stop
    Write-Host "Utilisateur Etudiant1 ajouté au groupe $GroupName" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors de l'ajout d'Etudiant1 au groupe : $_" -ForegroundColor Yellow
}

try {
    Add-ADGroupMember -Identity $GroupName -Members "Etudiant2" -ErrorAction Stop
    Write-Host "Utilisateur Etudiant2 ajouté au groupe $GroupName" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors de l'ajout d'Etudiant2 au groupe : $_" -ForegroundColor Yellow
}

# 5. Créer le dossier partagé
if (-not (Test-Path $SharedFolderPath)) {
    New-Item -ItemType Directory -Path $SharedFolderPath -Force | Out-Null
    Write-Host "Dossier créé : $SharedFolderPath" -ForegroundColor Green
}
else {
    Write-Host "Le dossier existe déjà : $SharedFolderPath" -ForegroundColor Yellow
}

# 6. Configurer les permissions NTFS
$Acl = Get-Acl $SharedFolderPath
$GroupSID = (Get-ADGroup -Identity $GroupName).SID
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $GroupSID,
    "Modify",
    "ContainerInherit,ObjectInherit",
    "None",
    "Allow"
)
$Acl.SetAccessRule($AccessRule)
Set-Acl -Path $SharedFolderPath -AclObject $Acl
Write-Host "Permissions NTFS configurées" -ForegroundColor Green

# 7. Créer le partage SMB
try {
    $Share = Get-SmbShare -Name $ShareName -ErrorAction Stop
    Write-Host "Le partage $ShareName existe déjà" -ForegroundColor Yellow
}
catch {
    New-SmbShare -Name $ShareName -Path $SharedFolderPath -FullAccess $GroupName
    Write-Host "Partage SMB créé : $ShareName" -ForegroundColor Green
}

# Afficher les informations du partage
Get-SmbShare -Name $ShareName | Format-List

$UNCPath = "\\$ServerName\$ShareName"
Write-Host "Partage SMB créé : $UNCPath" -ForegroundColor Green

# 8. Créer le script de logon
$ScriptPath = "C:\Scripts\MapDrive-Z.bat"
$ScriptName = "MapDrive-Z.bat"

$ScriptContent = @"
@echo off
net use Z: \\$ServerName\SharedResources /persistent:yes
"@

# S'assurer que le dossier Scripts existe
if (-not (Test-Path "C:\Scripts")) {
    New-Item -ItemType Directory -Path "C:\Scripts" -Force | Out-Null
}

$ScriptContent | Out-File -FilePath $ScriptPath -Encoding ASCII
Write-Host "Script logon créé : $ScriptPath" -ForegroundColor Green

# 9. Copier le script vers SYSVOL
try {
    # S'assurer que le dossier scripts existe dans SYSVOL
    if (-not (Test-Path $SysvolScripts)) {
        New-Item -ItemType Directory -Path $SysvolScripts -Force | Out-Null
    }
    
    Copy-Item -Path $ScriptPath -Destination "$SysvolScripts\$ScriptName" -Force
    Write-Host "Script de logon copié dans SYSVOL" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors de la copie du script : $_" -ForegroundColor Red
}

# 10. Créer et configurer la GPO
$GPOName = "MapSharedFolder"

try {
    $GPO = Get-GPO -Name $GPOName -ErrorAction Stop
    Write-Host "La GPO $GPOName existe déjà" -ForegroundColor Yellow
}
catch {
    $GPO = New-GPO -Name $GPOName
    Write-Host "GPO créée : $GPOName" -ForegroundColor Green
}

# Lier la GPO à l'OU Students
try {
    New-GPLink -Name $GPOName -Target $OUPath -ErrorAction Stop | Out-Null
    Write-Host "GPO '$GPOName' liée à l'OU Students" -ForegroundColor Green
}
catch {
    Write-Host "La GPO est déjà liée à l'OU ou erreur : $_" -ForegroundColor Yellow
}

# Configurer le script de logon dans la GPO
$GPOPath = "\\$DomainName\SYSVOL\$DomainName\Policies\{" + $GPO.Id + "}\User\Scripts\Logon"

if (-not (Test-Path $GPOPath)) {
    New-Item -ItemType Directory -Path $GPOPath -Force | Out-Null
}

# Copier le script dans le dossier de la GPO
Copy-Item -Path $ScriptPath -Destination "$GPOPath\$ScriptName" -Force

# Créer le fichier psscripts.ini pour configurer le script de logon
$IniPath = "\\$DomainName\SYSVOL\$DomainName\Policies\{" + $GPO.Id + "}\User\Scripts\scripts.ini"
$IniContent = @"
[Logon]
0CmdLine=$ScriptName
0Parameters=
"@

$IniContent | Out-File -FilePath $IniPath -Encoding Unicode -Force

Write-Host "✅ Script terminé avec succès !" -ForegroundColor Green
