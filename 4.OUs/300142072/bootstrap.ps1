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
