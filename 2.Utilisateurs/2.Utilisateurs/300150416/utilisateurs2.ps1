# === BLOC USERS AUTONOME (sans chemin) ===
$Users = @(
    [pscustomobject]@{Nom="Dupont";     Prenom="Alice";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine";    Prenom="Sarah";    Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";     Prenom="Karim";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lionel";     Prenom="Messi";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Nom="Cristiano";  Prenom="Ronaldo";  Login="cr7";      OU="Stagiaires"}
)

# Affichage de contrôle
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Création de groupes (hashtable nom -> membres[])
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Exemple fourni : ajouter Alice (adupont)
$Groups["GroupeFormation"] += ($Users | Where-Object Login -eq "adupont")

# Exercice 2 : ajouter tous les OU="Stagiaires" dans GroupeFormation
$Groups["GroupeFormation"] += ($Users | Where-Object { $_.OU -eq "Stagiaires" })

# Contrôle
"Total dans GroupeFormation: $($Groups["GroupeFormation"].Count)"
$Groups["GroupeFormation"] | Select-Object Prenom,Nom,Login,OU
