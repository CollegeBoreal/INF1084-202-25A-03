Import-Module ActiveDirectory

$domainName = "dc300150433-00.local"

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
