# Sourcer le bootstrap pour récupérer les variables
. "C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300143951\bootstrap.ps1"

# Maintenant $domainName est disponible
Import-Module ActiveDirectory
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
