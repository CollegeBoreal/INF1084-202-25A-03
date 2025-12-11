. .\bootstrap.ps1
# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName


Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

