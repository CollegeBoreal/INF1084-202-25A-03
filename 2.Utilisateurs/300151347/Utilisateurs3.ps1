# Lister tous les utilisateurs dont le prénom contient "a" (majuscule/minuscule)
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}


