# Demander les identifiants d'un compte administrateur de AD2
$cred = Get-Credential -Message "Entrez les identifiants AD2"

# Créer un PSDrive pour accéder à AD2 en spécifiant le serveur
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "" -Server "DC300148450.DC300148450.local" -Credential $cred

# Se déplacer dans AD2
Set-Location AD2:\

# Lister les unités organisationnelles
Get-ChildItem

# Note : Pour supprimer le lecteur PS après utilisation, vous pouvez exécuter :
# Remove-PSDrive -Name AD2
