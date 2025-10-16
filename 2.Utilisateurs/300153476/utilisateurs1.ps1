
# Définition initiale de $Users
$Users = @(
    @{Nom="Dupont";  Prenom="Alice";   Login="adupont";  OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah";   Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali";  Prenom="Karim";   Login="kbenali";  OU="Stagiaires"}
)

# Ajouter 2 nouveaux utilisateurs
$Users += @{Nom="Diallo"; Prenom="Ramatoulaye"; Login="rdiallo"; OU="Stagiaires"}
$Users += @{Nom="Smith";  Prenom="John";        Login="jsmith";  OU="Professeurs"}

# Afficher tous les utilisateurs
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
=======
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

# Afficher
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }
$Users += @{Nom="Diallo"; Prenom="Ramatoulaye"; Login="rdiallo"; OU="Stagiaires"}
$Users += @{Nom="Smith"; Prenom="John"; Login="jsmith"; OU="Professeurs"}
>>>>>>> 4fa7d0cb00039d9b1e49a55a6d197df4eb9d424a

