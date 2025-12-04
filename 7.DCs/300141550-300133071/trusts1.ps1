# Demander les identifiants d'un compte administrateur de la forêt
$cred = Get-Credential -Message "Entrez le compte administrateur"

# Vérifier la résolution DNS  
Resolve-DnsName DC300133071.DC300133071-00.local
Resolve-DnsName DC300141550.DC300141550.local

# Vérifier la connectivité réseau entre les domaines 
Test-Connection -ComputerName DC300133071.DC300133071-00.local -Count 2
Test-Connection -ComputerName DC300141550.DC300141550.local -Count 2

# Obtenir les informations générales du domaine AD2
Get-ADDomain -Server DC300141550.DC300141550.local -Credential $cred

# Lister tous les utilisateurs de AD2
Get-ADUser -Filter * -Server DC300141550.DC300141550.local -Credential $cred

# Créer un trust bidirectionnel entre les deux forêt
netdom trust DC300133071-00.local /Domain:DC300141550-00.local /UserD:administrator /PasswordD:* /Add /Realm /TwoWay
