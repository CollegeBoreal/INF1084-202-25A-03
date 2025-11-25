

# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server $DC300147816.local
Get-ADDomainController -Filter * -Server $DC300147816.local

