# 1️⃣ Préparer l’environnement

# Définir le nom du domaine
$domainName = "DC300151825-00.local"

# Importer le module Active Directory
Import-Module ActiveDirectory

# Vérifier le domaine
Get-ADDomain -Server $domainName

# Vérifier les contrôleurs de domaine
Get-ADDomainController -Filter * -Server $domainName
