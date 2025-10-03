# utilisateurs1.ps1

# Liste initiale d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

# Ajouter 2 nouveaux utilisateurs
$Users += @{Nom="Moreau"; Prenom="Julien"; Login="jmoreau"; OU="Stagiaires"}
$Users += @{Nom="Petit"; Prenom="Laura"; Login="lpetit"; OU="Stagiaires"}

# Afficher tous les utilisateurs
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

