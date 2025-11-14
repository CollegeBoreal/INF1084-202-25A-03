# Définir la liste des utilisateurs
$Users = @(
    @{ Nom = "Meziani"; Prenom = "Lytissia"; Login = "mlytissia"; OU = "Stagiaires" },
    @{ Nom = "Zourane"; Prenom = "Amel"; Login = "amelz"; OU = "Stagiaires" },
    @{ Nom = "Abed"; Prenom = "Ines"; Login = "inesa"; OU = "Stagiaires" },
    @{ Nom = "Zerkani"; Prenom = "Kahina"; Login = "kzerkani"; OU = "Stagiaires" },
    @{ Nom = "Hocine"; Prenom = "Sara"; Login = "shocine"; OU = "Stagiaires" }
)

# Lister tous les utilisateurs dont le prénom contient "a" (majuscule ou minuscule)
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

