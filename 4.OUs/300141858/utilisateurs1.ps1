# 1 - Préparer l'environnement pour le domaine de Karim

. "$PSScriptRoot\bootstrap.ps1"     # charge mes variables (domainName, cred, etc.)
Import-Module ActiveDirectory       # charge le module AD

# Vérifier le domaine et les contrôleurs de domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
