# Définir la liste des utilisateurs
$Users = @(
    @{ Nom = "Dupont";  Prenom = "Alice";   Login = "adupont";   OU = "Stagiaires" }
    @{ Nom = "Hocine";  Prenom = "Sara";    Login = "h.sara";    OU = "Stagiaires" }
    @{ Nom = "Zourane"; Prenom = "Amel";    Login = "a.zourane"; OU = "Stagiaires" }
    @{ Nom = "Zerkani"; Prenom = "Kahina";  Login = "kzerkani";  OU = "Stagiaires" }
    @{ Nom = "Sadouni"; Prenom = "Amira";   Login = "s.amira";   OU = "Stagiaires" }
)

# Créer des groupes (vides au départ)
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter uniquement les utilisateurs dont l'OU = "Stagiaires"
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Vérifier le contenu du groupe
$Groups["GroupeFormation"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login)"
}




