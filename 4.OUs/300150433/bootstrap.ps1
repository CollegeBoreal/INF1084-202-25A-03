# Numéro étudiant
$studentNumber = 300150433
$studentInstance = 00   # instance correcte pour ton domaine

# Domaine AD réel
$domainName  = "DC300150433-00.local"
$netbiosName = "DC300150433-00"

# Mot de passe administrateur du domaine
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force

# Création de l'objet d'identification pour l'administrateur du domaine
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# OU optionnel : demander le credential à l’utilisateur
$cred = Get-Credential
