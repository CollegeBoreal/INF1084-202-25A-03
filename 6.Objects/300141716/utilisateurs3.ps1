Write-Host "=== Configuration du partage réseau ===" -ForegroundColor Cyan

$SharePath = "C:\SharedResources"
$ShareName = "SharedResources"
$GroupName = "Students"
$DomainName = "DC3000141716-00"

# Vérifier que le groupe existe
$group = Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue
if (-not $group) {
    Write-Host "[ERREUR] Le groupe '$GroupName' n'existe pas." -ForegroundColor Red
    exit
}

# Créer le dossier si nécessaire
if (-not (Test-Path $SharePath)) {
    New-Item -Path $SharePath -ItemType Directory | Out-Null
    Write-Host "[OK] Dossier créé : $SharePath"
} else {
    Write-Host "[OK] Dossier déjà existant."
}

# Appliquer permissions NTFS
icacls $SharePath /grant "$DomainName\$GroupName:(OI)(CI)M" /T | Out-Null
Write-Host "[OK] Permissions NTFS appliquées."

# Supprimer ancien partage SMB si existe
if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
    Remove-SmbShare -Name $ShareName -Force
}

# Créer le partage SMB
New-SmbShare -Name $ShareName -Path $SharePath -FullAccess "$DomainName\$GroupName" | Out-Null
Write-Host "[OK] Partage SMB créé : \\$DomainName\$ShareName"

Write-Host "`n=== Vérification manuelle ===" -ForegroundColor Yellow
Write-Host "1. Connecte-toi avec un utilisateur du domaine"
Write-Host "2. Vérifie le lecteur Z: mappé par la GPO"
Write-Host "3. Essaie de créer un fichier dans Z:\ pour tester"

