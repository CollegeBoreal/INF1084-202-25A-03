# 3️⃣ Requêtes et filtres

# Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "`nUtilisateurs dont le nom commence par B :"
$Users | Where-Object { $_.Nom -like "B*" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`nUtilisateurs dans l'OU Stagiaires :"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Exercice 3 : Lister tous les utilisateurs dont le prénom contient "a" (insensible à la casse)
Write-Host "`nUtilisateurs dont le prénom contient 'a' :"
$Users | Where-Object { $_.Prenom -match "(?i)a" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

