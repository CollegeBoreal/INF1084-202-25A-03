<<<<<<< HEAD
# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
=======
# ===== utilisateurs1.ps1 =====
# Étape 1 : Préparer l'environnement AD pour le domaine de l'étudiant

# Variables du domaine
$studentNumber = 300141625
$studentInstance = 0

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

Write-Host "Nom du domaine : $domainName"
Write-Host "Nom NetBIOS : $netbiosName"

# Importer le module Active Directory
Import-Module ActiveDirectory

# Vérifier le domaine et les contrôleurs de domaine
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

# Récupérer les informations d'identification de l'administrateur
$cred = Get-Credential -Message "Entrez vos identifiants (Administrator@$domainName)"

>>>>>>> f0d0727bc244e2b9287e6fefbb63c49254d32a9f
