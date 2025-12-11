. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300144176\bootstrap.ps1"

# Création de l'OU Students si absente
$OUName = "Students"
$domainDN = (Get-ADDomain).DistinguishedName
$OUPath = "OU=$OUName,$domainDN"

if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$OUName)")) {
    New-ADOrganizationalUnit -Name $OUName -Path $domainDN
    Write-Host "OU '$OUName' créée."
} else {
    Write-Host "OU '$OUName' existe."
}

# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO si elle n'existe pas
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
}

# Lier la GPO à l'OU Students
$OU = "OU=Students,DC=DC300144176-01,DC=local"
New-GPLink -Name "MapsharedFolder" -Target $OU

# Paramètres du mapping
$DriveLetter = "Z"
$SharePath = "\\DC300144176-01\SharedResources"

# Récupération du GUID de la GPO
$GpoId = (Get-GPO -Name $GPOName).Id

# Chemin SYSVOL correct
$PreferencesPath = "\\DC300144176-01\SYSVOL\DC300144176-01\Policies\{$GpoId}\User\Preferences\Drives"

# Créer le dossier Drives si absent
if (-not (Test-Path $PreferencesPath)) {
    New-Item -ItemType Directory -Path $PreferencesPath | Out-Null
}

# Fichier XML du Drive Map
$DriveMapFile = "$PreferencesPath\ZDrive.xml"

$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<Drives cls="search">
  <Drive cls="I" name="${DriveLetter}">
    <Properties action="U" thisDrive="${DriveLetter}" path="${SharePath}" label="Shared Resources" persistent="0"/>
  </Drive>
</Drives>
"@

Set-Content -Path $DriveMapFile -Value $xml -Encoding UTF8

Write-Host "Script terminé."

