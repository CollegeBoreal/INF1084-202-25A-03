# Demander les identifiants d'un compte administrateur de AD2
$cred = Get-Credential -Message "Entrez les identifiants AD2"

# Créer un PSDrive pour accéder à AD2
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "DC=DC300141550,DC=local" -Credential $cred

# Se déplacer dans AD2
Set-Location AD2:\

# Lister les unités organisationnelles
Get-ChildItem

