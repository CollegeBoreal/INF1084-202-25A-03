Import-Module ActiveDirectory
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
