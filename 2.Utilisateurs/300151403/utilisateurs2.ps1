# Déclaration des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Déclaration de quelques utilisateurs
$Users = @(
    @{ Nom="Alice Dupont"; OU="Stagiaires" },
    @{ Nom="Bob Martin"; OU="Professeurs" },
    @{ Nom="Charlie Durand"; OU="Stagiaires" }
)

# Ajouter un utilisateur dans le groupe GroupeFormation
$Groups["GroupeFormation"] += $Users[0]   # Alice Dupont

# Lister tous les utilisateurs dont le nom commence par "B"
$Users | Where-Object { $_.Nom -like "B*" }

# Lister tous les utilisateurs dans l'OU "Stagiaires"
$Users | Where-Object { $_.OU -eq "Stagiaires" }


