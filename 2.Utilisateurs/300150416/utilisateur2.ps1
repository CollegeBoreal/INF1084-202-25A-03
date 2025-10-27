# Jeux de données (même base que le script 1)
$Users = @(
    [pscustomobject]@{Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Martin";  Prenom="Nora";   Login="nmartin";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Boucher"; Prenom="Adam";   Login="aboucher"; OU="Formation"}
)

# Création de groupes simulés (hashtable = nom du groupe -> membres)
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Exemple : ajouter un utilisateur précis
$Groups["GroupeFormation"] += ($Users | Where-Object Login -eq "adupont")

# Exercice 2 : ajouter tous les utilisateurs dont OU = "Stagiaires" dans "GroupeFormation"
$Groups["GroupeFormation"] += ($Users | Where-Object { $_.OU -eq "Stagiaires" })

# Affichage de contrôle
"Total dans GroupeFormation: " + ($Groups["GroupeFormation"].Count)
$Groups["GroupeFormation"] | Select-Object Prenom,Nom,Login,OU
