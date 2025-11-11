# Créer une liste d'utilisateurs simulés
$Users = @(
[PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
[PSCustomObject]@{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
[PSCustomObject]@{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
[PSCustomObject]@{Nom="Zerrouki"; Prenom="Hanane"; Login="Hzerrouki"; OU="Stagiaire"},
 
[PSCustomObject]@{Nom="Zerrouki"; Prenom="Wahiba"; Login="Wzerrouki"; OU="Stagiaire"}
)

# Afficher les utilisateurs
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }


