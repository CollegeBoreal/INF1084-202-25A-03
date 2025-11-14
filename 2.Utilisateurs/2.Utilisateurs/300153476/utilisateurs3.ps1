. .\utilisateurs2.ps1

# Lister tous les utilisateurs dont le nom commence par "B"
$Users | Where-Object {$_.Nom -like "B*"}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
$Users | Where-Object {$_.OU -eq "Stagiaires"}
# Lister tous les utilisateurs dont le prénom contient "a" ou "A"
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - OU: $($_.OU)"
}

