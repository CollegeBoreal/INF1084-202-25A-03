Import-Module ActiveDirectory
<<<<<<< HEAD
Get-ADDomain -Server "dc300151258-00.local"
<<<<<<< HEAD
Get-ADDomainController -Filter * -Server "dc300151258-00.local"
=======
Get-ADDomainController -Filter * -Server "dc300151258-00.local"
>>>>>>> fb9e03bd1c76e4f145e51d62bac9393e6776990c 
=======

$domainName = "dc300151258-00.local"

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
>>>>>>> e531e11938a31f19675ed2afb245165b0b97d956
