# Créer une liste d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Paul"; Login="pmartin"; OU="Stagiaires"},
    @{Nom="Bernard"; Prenom="Sophie"; Login="sbernard"; OU="Stagiaires"}
)

# Afficher tous les utilisateurs
Write-Host "Liste complète des utilisateurs :" -ForegroundColor Green
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "`nUtilisateurs dont le nom commence par 'B' :" -ForegroundColor Yellow
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))"
}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`nUtilisateurs dans l'OU 'Stagiaires' :" -ForegroundColor Cyan
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))"
}

# Exercice 3 : Lister tous les utilisateurs dont le prénom contient "a" (insensible à la casse)
Write-Host "`nExercice 3 - Utilisateurs dont le prénom contient 'a' (insensible à la casse) :" -ForegroundColor Magenta
$UsersWithA = $Users | Where-Object {$_.Prenom -like "*a*"}
$UsersWithA | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))" -ForegroundColor White
}

# Version alternative avec -match pour plus de précision (optionnel)
Write-Host "`nVérification avec -match :" -ForegroundColor DarkYellow
$Users | Where-Object {$_.Prenom -match "a"} | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (contient 'a' ou 'A')"
}