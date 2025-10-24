# Déclaration des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Déclaration des utilisateurs
$Users = @(
    @{ Nom="Alice Dupont"; OU="Stagiaires" },
    @{ Nom="Bob Martin"; OU="Professeurs" },
    @{ Nom="Benoit Leroy"; OU="Stagiaires" },
    @{ Nom="Charlie Durand"; OU="Stagiaires" }
)

# Ajouter Alice dans GroupeFormation
$Groups["GroupeFormation"] += $Users[0]

# Lister tous les utilisateurs dont le nom commence par "B"
$Users | Where-Object { $_.Nom -like "B*" }

# Lister tous les utilisateurs dans l'OU "Stagiaires"
$Users | Where-Object { $_.OU -eq "Stagiaires" }





