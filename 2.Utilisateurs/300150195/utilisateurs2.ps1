# Définir la liste des utilisateurs
$Users = @(
    @{ Nom = "Meziani"; Prenom = "Lytissia"; Login = "mlytissia"; OU = "Stagiaires" },
    @{ Nom = "Zourane"; Prenom = "Amel"; Login = "amelz"; OU = "Stagiaires" },
    @{ Nom = "Abed"; Prenom = "Ines"; Login = "inesa"; OU = "Stagiaires" },
    @{ Nom = "Zerkani"; Prenom = "Kahina"; Login = "kzerkani"; OU = "Stagiaires" },
    @{ Nom = "Hocine"; Prenom = "Sara"; Login = "shocine"; OU = "Stagiaires" }
)

# Créer des groupes (vides au départ)
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter uniquement les utilisateurs dont l'OU = "Stagiaires"
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Vérifier le contenu du groupe
{
$Groups["GroupeFormation"] | ForEach-Object
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
{

    "$($_.Name) - Login: $($_.Login) - OU: $($_.OU)"
}
   

