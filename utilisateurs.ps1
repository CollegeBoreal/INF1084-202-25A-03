# Créer une liste d'utilisateurs simulés
$Users = @(
    @{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
    @{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
    @{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" }
    @{ Nom="djellouli"; Prenom="Zakaria"; Login="zdjellouli"; OU="Promo2025" },
    @{ Nom="Hocine";  Prenom="Sara"; Login="shocine;  OU="Stagiaires" }
)
# Afficher les utilisateurs
$Users | ForEach-Object { "$($.Prenom) $($.Nom) - Login: $($.Login) - OU: $($.OU)" }
