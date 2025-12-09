# ==============================
# Dot-sourcing du bootstrap
# ==============================
. .\bootstrap.ps1


# ==============================
# Création de la GPO
# ==============================
$GPOName = "MapSharedFolder"
New-GPO -Name $GPOName

# Lier la GPO à l'OU Students
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU

# Script de logon pour le lecteur Z:
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-Z.bat"

if (-not (Test-Path $ScriptFolder)) {
    New-Item -Path $ScriptFolder -ItemType Directory
}

$SharePath = "\\$netbiosName\SharedResources"
$ScriptContent = "net use Z: $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $ScriptContent

# Attacher le script à la GPO
Set-GPStartupScript -Name $GPOName -ScriptName "MapDrive-Z.bat" -ScriptPath $ScriptFolder


