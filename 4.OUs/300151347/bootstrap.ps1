# =============================
# 🚀 TP Active Directory - Bootstrap
# Étudiante : Hocine Sara (300151347)
# Domaine : DC300151347-0.local
# =============================

# Informations personnelles
$studentNumber = 300151347
$studentInstance = "0"

# Noms respectifs
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Importation du module Active Directory
Import-Module ActiveDirectory

# Vérification du domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
