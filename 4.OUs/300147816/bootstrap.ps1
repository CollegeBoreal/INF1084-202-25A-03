
# vos informations
$studentNumber = 300147816
$studentInstance = "0"

# les noms respectifs
$domainName = "DC300147816.local"
$netbiosName = "DC300147816VM"

# les informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
$shareName = "SharedResources"
