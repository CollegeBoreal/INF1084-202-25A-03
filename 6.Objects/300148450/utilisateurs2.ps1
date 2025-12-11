<# =========================================================
 utilisateurs2.ps1 – GPO pour mapper lecteur Z:
 Domaine : DC300148450-00.local
========================================================= #>

# Charger bootstrap
. "$PSScriptRoot\..\..\4.OUs\300148450\bootstrap.ps1"

Import-Module ActiveDirectory
Import-Module GroupPolicy

Write-Host "=== 1. GPO MapSharedFolder ==="

$GPOName = "MapSharedFolder"

$gpo = Get-GPO -Name $GPOName -ErrorAction SilentlyContinue
if (-not $gpo) {
    $gpo = New-GPO -Name $GPOName
    Write-Host "GPO créée."
} else {
    Write-Host "GPO déjà existante."
}

Write-Host "=== 2. Lien GPO → OU Students ==="

$OU = "OU=Students,DC=$netbiosName,DC=local"

# Vérifier si la GPO est déjà liée
$links = (Get-GPInheritance -Target $OU).GpoLinks
$alreadyLinked = $links | Where-Object { $_.GpoId -eq $gpo.Id }

if (-not $alreadyLinked) {
    New-GPLink -Name $GPOName -Target $OU -Enforced No
    Write-Host "Lien ajouté."
} else {
    Write-Host "Lien déjà présent → OK."
}

Write-Host "=== 3. Création du script logon (Z:) ==="

$DriveLetter = "Z:"
$SharePath   = "\\$netbiosName\SharedResources"

$ScriptFolder = "C:\Scripts"
$ScriptPath   = "$ScriptFolder\MapDrive-$DriveLetter.bat"

if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

"net use $DriveLetter $SharePath /persistent:no" | Set-Content $ScriptPath

Write-Host "Script créé : $ScriptPath"

Write-Host "=== 4. Enregistrement du script dans la GPO ==="

Set-GPRegistryValue -Name $GPOName `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
    -ValueName "LogonScript" `
    -Type String `
    -Value $ScriptPath

Write-Host "`n=== Script utilisateurs2.ps1 terminé avec succès ==="
