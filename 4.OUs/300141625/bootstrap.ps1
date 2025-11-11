# bootstrap.ps1
# Script de configuration initiale pour le TP AD

# -------------------------------
# Informations personnelles / étudiant
# -------------------------------
$studentNumber = 300141625
$studentInstance = 0

# -------------------------------
# Noms de domaine
# -------------------------------
$domainName = "DC300141625-00.local"   # FQDN du domaine
$netbiosName = "DC300141625-00"       # Nom NetBIOS court

# -------------------------------
# Informations de sécurité pour l'administrateur
# -------------------------------
$plain = 'Infra@2024'   # mot de passe administrateur
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# -------------------------------
# Astuce : pour les commandes nécessitant des credentials
# -------------------------------
# Exemples :
# Get-ADUser -Filter * -Server $domainName -Credential $cred
# New-ADUser -Name "Alice Dupont" -Credential $cred
