# utilisateurs1.ps1

# Création d’objets utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

# Ajout de 2 nouveaux utilisateurs
$Users += @{Nom="Martin"; Prenom="Lucas"; Login="lmartin"; OU="Stagiaires"}
$Users += @{Nom="Nguyen"; Prenom="Sofia"; Login="snguyen"; OU="Stagiaires"}

# Vérification affichage
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }
