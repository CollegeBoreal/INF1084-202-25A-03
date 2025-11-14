$Users = @(
    [PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

$Users += @(
    [PSCustomObject]@{Nom="Martin"; Prenom="Luc"; Login="lmartin"; OU="Stagiaires"},
    [PSCustomObject]@{Nom="bouhali"; Prenom="rabia"; Login="Ravi3"; OU="Stagiaires"}
)

$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

