# Création d'une liste d'utilisateurs simulés

$Users = @(
    [PSCustomObject]@{ Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires" },
    [PSCustomObject]@{ Nom="Bernard"; Prenom="Bob"; Login="bbernard"; OU="Professeurs" },
    [PSCustomObject]@{ Nom="Charpentier"; Prenom="Chloé"; Login="ccharpentier"; OU="Stagiaires" },
    [PSCustomObject]@{ Nom="Bouzid"; Prenom="Nadia"; Login="nbouzid"; OU="Stagiaires" },
    [PSCustomObject]@{ Nom="Saidi"; Prenom="Omar"; Login="osaidi"; OU="Stagiaires" }
)

# Afficher les utilisateurs
$Users | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

