# ===============================
#  utilisateurs2.ps1
#  Création GPO + mapping lecteur Z:
#  Domaine : DC300151258.local
# ===============================

Import-Module ActiveDirectory
Import-Module GroupPolicy

# Nom de la GPO
$GPOName = "MapSharedFolder"

# Création de la GPO (ne recrée pas si déjà existante)
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
    Write-Host "GPO '$GPOName' créée."
} else {
    Write-Host "GPO '$GPOName' existe déjà — OK."
}

# OU cible (confirmée via Get-ADOrganizationalUnit)
$OU = "OU=Students,DC=DC300151258,DC=local"

# Lier la GPO à l’OU
try {
    New-GPLink -Name $GPOName -Target $OU -Enforced No
    Write-Host "GPO liée à l’OU Students."
}
catch {
    Write-Host "Le lien existe déjà — OK."
}

# Mapping du lecteur réseau Z:
$DriveLetter = "Z:"
$SharePath = "\\D300151258\SharedResources"

# Dossier scripts
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

# Créer dossier scripts si absent
if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

# Contenu du script login
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent -Encoding ASCII

Write-Host "Script de connexion créé : $ScriptPath"

# Associer le script à la GPO → section User Configuration
Set-GPRegistryValue -Name $GPOName `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LogonScript" `
    -Type String `
    -Value $ScriptPath

Write-Host "Script de connexion assigné à la GPO."

Write-Host "`n=== Script utilisateurs2.ps1 terminé avec succès ==="
