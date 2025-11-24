Import-Module ActiveDirectory
Get-ADDomain -Server "dc300150433-00.local"
Get-ADDomainController -Filter * -Server "dc300150433-00.local"