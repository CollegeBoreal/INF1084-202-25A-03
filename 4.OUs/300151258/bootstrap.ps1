 # vos informations
$studentNumber = 300151258
$studentInstance = ""

# les noms respectifs
$domainName = "DC$studentNumber.local"
$netbiosName = "DC$studentNumber"

# les informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure
