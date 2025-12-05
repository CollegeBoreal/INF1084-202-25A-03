# Créer un PSDrive pour accéder à AD2
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root 300141550.3001441550.local -Credential $cred

# Se déplacer dans AD2
Set-Location AD2:\

# Lister les unités organisationnelles
Get-ChildItem
