
😙 LES OBJECTS

🔢 Creation du dossier partage
```
# Charger les informations du bootstrap
. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300142072\bootstrap.ps1"

# Chemin du dossier
$SharedFolder = "C:\SharedResources"

# Créer le dossier (si déjà existe, -Force évite l'erreur)
if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
}

# Nom du groupe
$GroupName = "Students"

# Créer le groupe AD seulement s'il n'existe pas
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"
}

# Liste des utilisateurs
$Users = @("Etudiant1","Etudiant2")

# Créer les utilisateurs et les ajouter au groupe
foreach ($user in $Users) {

    # Vérifier s'il existe déjà
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name $user `
            -SamAccountName $user `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true
    }

    # Ajouter au groupe (evite l'erreur si déjà membre)
    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

# Créer un partage SMB
# Vérifier si le partage existe déjà
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
} else {
    # Mettre à jour les permissions au cas où le groupe ne serait pas présent
    Grant-SmbShareAccess -Name "SharedResources" -AccountName $GroupName -AccessRight Full -Force
}
```
🔢 Créer une GPO pour mapper le lecteur réseau
```
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
```

🔢 Activer RDP pour le groupe
```
. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300142072\bootstrap.ps1"
# Autoriser les connexions RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" -Value 0

# Autoriser RDP dans le firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
# Définir le groupe à autoriser
$group = "Students"
$cfgPath = "$env:TEMP\secpol.cfg"
$dbPath  = "$env:TEMP\secpol.sdb"

# Exporter la configuration actuelle
secedit /export /cfg $cfgPath /areas USER_RIGHTS | Out-Null

# Lire le fichier
$content = Get-Content $cfgPath

# Chercher la ligne actuelle (si elle existe)
$matchLine = $content | Where-Object { $_ -match "^SeRemoteInteractiveLogonRight" }

if ($matchLine) {
    # Récupérer l’index correct
    $lineIndex = $content.IndexOf($matchLine)

    # Ajouter le groupe s’il n’est pas présent
    if ($matchLine -notmatch "\*$group") {
        $newLine = $matchLine + ",*$group"
        $content[$lineIndex] = $newLine
    }
}
else {
    # La ligne n’existe pas → on la crée
    Add-Content -Path $cfgPath -Value "SeRemoteInteractiveLogonRight = *$group"
}

# Réécrire le fichier mis à jour
$content | Set-Content $cfgPath

# Appliquer la nouvelle configuration
secedit /configure /db $dbPath /cfg $cfgPath /areas USER_RIGHTS | Out-Null

Write-Host "RDP activé et droits appliqués pour le groupe $group."
```
❗La verification se trouve dans le dossier image du projet

