 . .\bootstrap.ps1
# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
                                                                                                                                               Import-Module ActiveDirectory                                                                                                                                                                                                                                                                                                                                                                                                                                                             # Vérifier le domaine et les DC                                                                                                                                                                                                              Get-ADDomain
