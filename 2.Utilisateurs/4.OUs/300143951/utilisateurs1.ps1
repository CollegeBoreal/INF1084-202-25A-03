Import-Module ActiveDirectory   # importer le module AD

# Vérifier le domaine et les contrôleurs
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

