$OU = "OU=Utilisateurs,DC=DC300146418-00,DC=local"
$GPOName = "MapSharedFolder"

Write-Host "=== Création de la GPO pour mapper le lecteur Z ===" -ForegroundColor Cyan

# 1. Créer la GPO
New-GPO -Name $GPOName -ErrorAction SilentlyContinue | Out-Null
Write-Host "[OK] GPO créée."

# 2. Lier la GPO à l’OU
New-GPLink -Name $GPOName -Target $OU -LinkEnabled Yes | Out-Null
Write-Host "[OK] GPO liée à l’OU Utilisateurs."

# 3. Créer le script MapDriveZ.bat
$scriptPath = "\\DC300146418-00\SYSVOL\DC300146418-00.local\scripts"
if (!(Test-Path $scriptPath)) { New-Item -ItemType Directory -Path $scriptPath | Out-Null }

$batFile = "$scriptPath\MapDriveZ.bat"
"@echo off
net use Z: \\DC300146418-00\partage" | Out-File -FilePath $batFile -Encoding ASCII

Write-Host "[OK] Script créé : $batFile"

Write-Host ""
Write-Host "➡️ Étape MANUELLE dans GPMC :"
Write-Host "GPO > User Configuration > Windows Settings > Scripts (Logon) > Add MapDriveZ.bat" -ForegroundColor Yellow

