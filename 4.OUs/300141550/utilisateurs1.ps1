Import-Module ActiveDirectory 
Get-ADDomain -server "DC300141550.local"
Get-ADDomainController -Filter * -Server "DC0141550.local" 
