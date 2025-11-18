$studentNumber = 300150433
$studentInstance = 50

$domainName  = "DC300150433-50.local"
$netbiosName = "DC300150433-50"


$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)


$cred = Get-Credential
