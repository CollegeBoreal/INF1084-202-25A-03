# --- UT2 ---

# Nom du OU
$OUName = "Students"
$domainDN = (Get-ADDomain).DistinguishedName
$OUTarget = "OU=$OUName,$domainDN"

# Créer OU s’il n’existe pas
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OUName'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name $OUName -Path $domainDN
    Write-Host "OU '$OUName' créé."
} else {
    Write-Host "OU '$OUName' existe déjà."
}

# Nom de la GPO
$GPOName = "MapSharedFolder"

# Créer GPO si elle n’existe pas
if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
    Write-Host "GPO '$GPOName' créée."
} else {
    Write-Host "GPO '$GPOName' existe déjà."
}

# Lier la GPO à l’OU
try {
    New-GPLink -Name $GPOName -Target $OUTarget -Enforced No -ErrorAction Stop
    Write-Host "GPO liée à l’OU."
} catch {
    Write-Host "GPO déjà liée → OK."
}

# Mapping Z: avec les préférences
$DriveLetter = "Z"
$netbiosName = $env:COMPUTERNAME
$SharePath = "\\$netbiosName\SharedResources"

$GPO = Get-GPO -Name $GPOName
$GpoId = $GPO.Id

# Chemin du dossier Drives
$PreferencesPath = "\\$env:USERDNSDOMAIN\SYSVOL\$env:USERDNSDOMAIN\Policies\{$GpoId}\User\Preferences\Drives"

if (-not (Test-Path $PreferencesPath)) {
    New-Item -ItemType Directory -Path $PreferencesPath | Out-Null
}

# Chemin XML
$DriveMapFile = "$PreferencesPath\ZDrive.xml"

# XML pour la préférence
$xml = @"
<?xml version="1.0" encoding="utf-8"?>
<Drives cls="search">
  <Drive cls="I" name="${DriveLetter}">
    <Properties action="U" thisDrive="${DriveLetter}" path="${SharePath}" label="Shared Resources" persistent="0"/>
  </Drive>
</Drives>
"@

# Création du fichier XML
Set-Content -Path $DriveMapFile -Value $xml -Encoding UTF8

Write-Host "Fichier XML créé : $DriveMapFile"

