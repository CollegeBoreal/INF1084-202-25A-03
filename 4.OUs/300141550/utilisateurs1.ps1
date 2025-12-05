 Import-Module ActiveDirectory
Get-ADDomain -Server "DC300141550.local"
Get-ADDomainController -Filter * -Server "DC300141550.local"
