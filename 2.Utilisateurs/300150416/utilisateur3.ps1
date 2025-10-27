# Jeux de données
$Users = @(
    [pscustomobject]@{Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Martin";  Prenom="Nora";   Login="nmartin";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Boucher"; Prenom="Adam";   Login="aboucher"; OU="Formation"}
)

# Nom commençant par "B"
"--- Noms commençant par 'B' ---"
$Users | Where-Object { $_.Nom -like "B*" } | Select-Object Prenom,Nom

# Utilisateurs dans l'OU "Stagiaires"
"--- OU = 'Stagiaires' ---"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | Select-Object Prenom,Nom,OU

# Exercice 3 : prénom contenant "a" (insensible à la casse)
"--- Prénom contient 'a' (case-insensitive) ---"
$Users | Where-Object { $_.Prenom -match '(?i)a' } | Select-Object Prenom,Nom
