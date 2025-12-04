 # Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO
New-GPO -Name $GPOName

# Récupérer le DN du domaine automatiquement
$domainDN = (Get-ADDomain).DistinguishedName

# OU cible (Students)
$OU = "OU=Students,$domainDN"

# Lier la GPO à l’OU Students
New-GPLink -Name $GPOName -Target $OU

# Créer une préférence pour mapper le lecteur réseau Z:
$DriveLetter = "Z:"
$SharePath = "\\$netbiosName\SharedResources"

# Créer le dossier où sera le script de logon
$ScriptFolder = "C:\Scripts"
if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder
}

# Chemin du script .bat
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

# Contenu du script logon
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent
