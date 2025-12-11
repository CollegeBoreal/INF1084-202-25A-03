Write-Host "=== Configuration du partage réseau ===" -ForegroundColor Cyan

$SharePath = "C:\Partage_Students"
$ShareName = "partage"
$GroupName = "Students"

# Vérifier que le groupe existe
$group = Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue
if (-not $group) {
    Write-Host "[ERREUR] Le groupe '$GroupName' n'existe pas." -ForegroundColor Red
    exit
}

# Créer le dossier
if (-not (Test-Path $SharePath)) {
    New-Item -Path $SharePath -ItemType Directory | Out-Null
    Write-Host "[OK] Dossier créé : $SharePath"
} else {
    Write-Host "[OK] Dossier déjà existant."
}

# Appliquer permissions NTFS (VERSION FIX)
icacls $SharePath /grant "${env:USERDOMAIN}\${GroupName}:(OI)(CI)M" /T | Out-Null
Write-Host "[OK] Permissions NTFS appliquées."

# Supprimer ancien partage SMB
if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
    Remove-SmbShare -Name $ShareName -Force
}

# Créer le partage SMB
New-SmbShare -Name $ShareName -Path $SharePath -FullAccess "${env:USERDOMAIN}\${GroupName}" | Out-Null
Write-Host "[OK] Partage SMB créé : \\$env:COMPUTERNAME\$ShareName"

Write-Host "`n=== Test du lecteur Z (manuel) ===" -ForegroundColor Yellow
Write-Host "1. Connecte-toi avec un utilisateur du domaine"
Write-Host "2. Vérifie que le lecteur Z: apparaît"
Write-Host "3. Crée un fichier dans Z:\ pour tester"

