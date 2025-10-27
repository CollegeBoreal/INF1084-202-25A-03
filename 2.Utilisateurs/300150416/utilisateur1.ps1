# Création d'utilisateurs simulés (PSCustomObject pour un accès .Propriété)
$Users = @(
    [pscustomobject]@{Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires"}
)

# Exercice 1 : ajouter 2 nouveaux utilisateurs
$Users += @(
    [pscustomobject]@{Nom="Martin"; Prenom="Nora";   Login="nmartin";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Boucher"; Prenom="Adam";  Login="aboucher"; OU="Formation"}
)

# Afficher la liste
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
