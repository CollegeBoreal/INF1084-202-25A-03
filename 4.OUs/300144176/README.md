$studentNumber = 300144176
$studentInstance = "01"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

````````````
Import-Module ActiveDirectory

# Vérifier le domaine et le contrôleur
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

````````````
Get-ADUser -Filter * | Select-Object Name, SamAccountName

New-ADUser `
  
