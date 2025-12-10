🌼TP : Gestion des utilisateurs Active Directory avec PowerShell

🔢 Creation du boostrap.ps1
```
# ==========================
#   Informations étudiant
# ==========================

$studentNumber = 300142072
$studentInstance = 50

# Domaines générés
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Import module Active Directory
Import-Module ActiveDirectory
```
🔢 Preparation de l'environnement
```
. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
```

![images](WhatsApp%20Image%202025-12-09%20at%2021.31.46.jpeg)




