# ================================
# Script 2 - GPO pour mapper le lecteur Z:
# ================================

Import-Module ActiveDirectory
Import-Module GroupPolicy

# 1. Récupérer automatiquement le domaine
$domainDN = (Get-ADDomain).DistinguishedName

# 2. Création OU Students si elle n'existe pas
$OUName = "Students"
$OUPath = "OU=$OUName,$domainDN"

if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name $OUName -Path $domainDN -ProtectedFromAccidentalDeletion $false
    Write-Host "OU 'Students' créée."
} else {
    Write-Host "OU 'Students' existe déjà."
}

# 3. Nom de la GPO
$GPOName = "MapSharedFolder"

# 4. Créer la GPO si elle n'existe pas
$GPO = Get-GPO -Name $GPOName -ErrorAction SilentlyContinue
if (-not $GPO) {
    $GPO = New-GPO -Name $GPOName
    Write-Host "GPO créée : $GPOName"
} else {
    Write-Host "GPO existe déjà."
}

# 5. Lier la GPO à l'OU Students
New-GPLink -Name $GPOName -Target $OUPath -Enforced No
Write-Host "GPO liée à l'OU : $OUPath"

# 6. Préparer Drive Map Z: via GPP
$Server = $env:COMPUTERNAME
$SharePath = "\\$Server\SharedResources"
$DriveLetter = "Z"

# 7. Chemin GPP de la GPO
$GpoId = $GPO.Id
$PreferencesPath = "\\$env:USERDNSDOMAIN\SYSVOL\$env:USERDNSDOMAIN\Policies\{$GpoId}\User\Preferences\Drives"

# 8. Créer le dossier si manquant
if (-not (Test-Path $PreferencesPath)) {
    New-Item -ItemType Directory -Path $PreferencesPath -Force | Out-Null
}

# 9. Fichier XML du Drive Map
$DriveMapFile = "$PreferencesPath\ZDrive.xml"

$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<Drives cls="search">
  <Drive cls="I" name="${DriveLetter}" status="A" userContext="0">
    <Properties action="U" thisDrive="${DriveLetter}" path="${SharePath}" label="Shared Resources" persistent="0"/>
  </Drive>
</Drives>
"@

Set-Content -Path $DriveMapFile -Value $xml -Encoding UTF8

Write-Host "✔ Drive Map Z: configuré dans la GPO"
Write-Host "✔ Script utilisateurs2.ps1 terminé avec succès !"
