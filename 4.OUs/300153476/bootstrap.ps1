# ==========================
#   Informations étudiant
# ==========================

$studentNumber = 300153476
$studentInstance = "00"

# Domaines générés
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

<<<<<<< HEAD

=======
>>>>>>> e95d58b0e325c665479891f071375d71a31f3231
