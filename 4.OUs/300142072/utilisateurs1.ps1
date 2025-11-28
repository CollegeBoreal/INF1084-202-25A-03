Import-Module ActiveDirectory

$studentNumber = 300142072
$studentInstance = 20
$domainName = "DC$studentNumber-$studentInstance.local"

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
