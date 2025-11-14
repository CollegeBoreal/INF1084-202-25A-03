# -----------------------------
# Exercice 3 : Requêtes et filtres
# -----------------------------

# Définir les utilisateurs
$Users = @(
    @{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
    @{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
    @{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" },
    @{ Nom="Sadouni"; Prenom="Amira";  Login="asadouni"; OU="Promo2025" },
    @{ Nom="Hocine";  Prenom="Sara";   Login="shocine";  OU="Stagiaires" }
)

# 1️⃣ Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "1️⃣ Utilisateurs dont le nom commence par 'B'"
$Users | Where-Object { $_.Nom -like "B*" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) ($($_.Login))"
}

# 2️⃣ Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`n2️⃣ Utilisateurs dans l'OU 'Stagiaires'"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) ($($_.Login))"
}

# 3️⃣ Lister tous les utilisateurs dont le prénom contient la lettre "a" (majuscule/minuscule)
Write-Host "`n3️⃣ Utilisateurs dont le prénom contient la lettre 'a'"
$Users | Where-Object { $_.Prenom -match "(?i)a" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) ($($_.Login))"
}


