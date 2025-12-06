# Créer un PSDrive pour parcourir AD2
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "DC300153476-00.local" -Credential $credAD2

# Se placer dans la racine du domaine AD2
Set-Location AD2:\DC=DC300153476-00,DC=local

# Lister les éléments du domaine AD2
Get-ChildItem
