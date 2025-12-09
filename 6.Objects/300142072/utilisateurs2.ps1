. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300142072\bootstrap.ps1"

# cree le Ou s'il n'existe pas
$OUName = "Students"
$domainDN = (Get-ADDomain).DistinguishedName
$OU = "OU=$OUName,$domainDN"

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OUName'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name $OUName -Path $domainDN
    Write-Host "OU '$OUName' cree."
} else {
    Write-Host "OU '$OUName' existe ."
}
# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer la GPO si elle n'existe pas
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
}

# Lier la GPO à une OU spécifique
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU

# Paramètres du mapping
$DriveLetter = "Z"
$SharePath = "\\$netbiosName\SharedResources"

# Créer la préférence Drive Map (GPP)
$GPO = Get-GPO -Name $GPOName
$GpoId = $GPO.Id

# Chemin d'écriture de la préférence Drive Maps
$PreferencesPath = "\\$env:USERDNSDOMAIN\SYSVOL\$env:USERDNSDOMAIN\Policies\{$GpoId}\User\Preferences\Drives"

# Créer le dossier Drives si absent
if (-not (Test-Path $PreferencesPath)) {
    New-Item -ItemType Directory -Path $PreferencesPath | Out-Null
}

# Fichier XML pour la préférence Drive Map
$DriveMapFile = "$PreferencesPath\ZDrive.xml"

$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<Drives cls="search">
  <Drive cls="I" name="${DriveLetter}">
    <Properties action="U" thisDrive="${DriveLetter}"" path="${SharePath}" label="Shared Resources" persistent="0"/>
  </Drive>
</Drives>
"@

Set-Content -Path $DriveMapFile -Value $xml -Encoding UTF8



