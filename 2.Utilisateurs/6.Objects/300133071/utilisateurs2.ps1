# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO (si elle n'existe pas déjà)
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName
}

# Nom NetBIOS du domaine
$netbiosName = (Get-ADDomain).NetBIOSName

# Lier la GPO à une OU spécifique (ex: "Students")
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU -Enforced:$false

# Définir les variables pour le lecteur réseau
$DriveLetter = "Z:"
$SharePath = "\\$netbiosName\SharedResources"

# Créer le dossier du script
$ScriptFolder = "C:\Scripts"
if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

# Créer le script batch pour mapper le lecteur
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent -Encoding ASCII

# Copier le script dans le dossier de scripts du domaine
$DomainSysvol = "\\$netbiosName\SYSVOL\$netbiosName\scripts"
Copy-Item -Path $ScriptPath -Destination $DomainSysvol -Force

# Ajouter le script de connexion à la GPO
Set-GPRegistryValue -Name $GPOName `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LogonScript" `
    -Type String `
    -Value "$DomainSysvol\MapDrive-$DriveLetter.bat"
# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO (si elle n'existe pas déjà)
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName
}

# Nom NetBIOS du domaine
$netbiosName = (Get-ADDomain).NetBIOSName

# Lier la GPO à une OU spécifique (ex: "Students")
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU -Enforced:$false

# Définir les variables pour le lecteur réseau
$DriveLetter = "Z:"
$SharePath = "\\$netbiosName\SharedResources"

# Créer le dossier du script
$ScriptFolder = "C:\Scripts"
if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

# Créer le script batch pour mapper le lecteur
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent -Encoding ASCII

# Copier le script dans le dossier de scripts du domaine
$DomainSysvol = "\\$netbiosName\SYSVOL\$netbiosName\scripts"
Copy-Item -Path $ScriptPath -Destination $DomainSysvol -Force

# Ajouter le script de connexion à la GPO
Set-GPRegistryValue -Name $GPOName `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LogonScript" `
    -Type String `
    -Value "$DomainSysvol\MapDrive-$DriveLetter.bat"

