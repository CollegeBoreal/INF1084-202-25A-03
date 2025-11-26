
# vos informations
$studentNumber = 300147816
$studentInstance = "0"

# les noms respectifs
$domainName = "DC$300147816-$0.local"
$netbiosName = "DC$300147816-$0"

# les informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
$shareName = "SharedResources"
