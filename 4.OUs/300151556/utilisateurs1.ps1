Import-Module ActiveDirectory

# Informations sur le domaine
Get-ADDomain -Server "DC300151556-00.local"

# Informations sur les contrôleurs de domaine
Get-ADDomainController -Filter * -Server "DC300151556-00.local"
