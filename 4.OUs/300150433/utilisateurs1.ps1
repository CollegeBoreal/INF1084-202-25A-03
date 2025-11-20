Import-Module ActiveDirectory
Get-ADDomain -Server "DC300150433-50.local"
Get-ADDomainController -Filter * -Server "DC300150433-50.local"
