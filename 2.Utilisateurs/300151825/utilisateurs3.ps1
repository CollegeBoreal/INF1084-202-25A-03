# utilisateurs3.ps1

# Lister les utilisateurs dont le prénom contient "a" (insensible à la casse)
$Users | Where-Object {$_.Prenom -match "(?i)a"} | ForEach-Object { "$($_.Prenom) $($_.Nom)" }

