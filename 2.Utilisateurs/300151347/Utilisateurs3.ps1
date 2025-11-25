# Liste des utilisateurs
$Users = @(
    @{ Nom = "Dupont";  Prenom = "Alice";   Login = "adupont";   OU = "Stagiaires"},
    @{ Nom = "Hocine";  Prenom = "Sara";    Login = "h.sara";    OU = "Stagiaires"},
    @{ Nom = "Benali";  Prenom = "Karim";   Login = "kbenali";   OU = "Stagiaires"}
)

# Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "📌 Utilisateurs dont le nom commence par B :"
$Users | Where-Object { $_.Nom -like "B*" } | ForEach-Object {
    Write-Host $_.Prenom $_.Nom
}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`n📌 Utilisateurs dans l'OU Stagiaires :"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | ForEach-Object {
    Write-Host $_.Prenom $_.Nom
}

# Lister tous les utilisateurs dont le prénom contient "a" (majuscule/minuscule)
Write-Host "`n📌 Utilisateurs dont le prénom contient 'a' :"
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object {
    Write-Host $_.Prenom $_.Nom
}

