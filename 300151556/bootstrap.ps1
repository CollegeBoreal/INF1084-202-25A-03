$studentNumber = 300151556
$studentInstance = 0

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

Import-Module ActiveDirectory
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
