# bootstrap.ps1 - Karim NIANG (300141858)

# vos informations
$studentNumber   = 300141858
$studentInstance = "01"

# les noms respectifs
$domainName  = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# charger le module AD (si pas déjà chargé)
Import-Module ActiveDirectory

# demander le mot de passe de l'administrateur du domaine
$secure = Read-Host -AsSecureString "Mot de passe pour Administrator@$domainName"
$cred   = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

Write-Host "Domaine   : $domainName"
Write-Host "NetBIOS   : $netbiosName"
Write-Host "Utilisateur: Administrator@$domainName"
