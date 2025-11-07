<# 
 Fichier : utilisateurs1.ps1
 TP : Simulation Active Directory (sans AD réel) 
 Étudiant : 300150416
#>

# Créer une liste d'utilisateurs simulés (PSCustomObject)
$Users = @(
    [pscustomobject]@{Nom="Dupont";     Prenom="Alice";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine";    Prenom="Sarah";    Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";     Prenom="Karim";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="lionel";     Prenom="messi";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Nom="cristiano";  Prenom="ronaldo";  Login="cr7";      OU="Stagiaires"}
)

# Afficher les utilisateurs
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
