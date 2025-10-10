# Définition des utilisateurs
$Users = @(
    @{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
    @{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
    @{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" },
    @{ Nom="Sadouni"; Prenom="Amira";  Login="asadouni"; OU="Promo2025" },
    @{ Nom="Hocine";  Prenom="Sara";   Login="shocine";  OU="Stagiaires" }
)

# Définition des groupes
$Groups = @{
    "GroupeFormation" = @()
}

# Ajout des utilisateurs dans GroupeFormation si OU = "Stagiaires"
$Groups["GroupeFormation"] += $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Affichage des utilisateurs du groupe
$Groups["GroupeFormation"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) ($($_.Login))"
}
