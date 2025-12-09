# Demander les identifiants du domaine de Sara
$cred = Get-Credential -Message "Entrez le compte Administrator du domaine DC300151347-00.local"

# Racine AD correcte (vue dans Get-ADDomain)
$root = "DC=DC300151347-00,DC=local"

# Créer un PSDrive AD vers le domaine de Sara
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root $root -Credential $cred

# Se déplacer dans le domaine de Sara
Set-Location AD2:\

# Lister les Unités Organisationnelles
Get-ChildItem