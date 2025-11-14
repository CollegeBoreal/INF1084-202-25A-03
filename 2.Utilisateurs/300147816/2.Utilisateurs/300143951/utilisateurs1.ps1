# Créer une liste d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    # Ajouter  2 nouveaux utilisateurs

    @{Nom="Santu"; Prenom="Emeraude"; Login="santueme"; OU="Stagiaires"},
    @{Nom="Kanu"; Prenom="Martin"; Login="kanumar"; OU="Stagiaires"}
)

# Afficher les utilisateurs
Write-Host "=== Liste des utilisateurs ===" -ForegroundColor Green
$Users | ForEach-Object { 
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" 
}

#  Retourner les utilisateurs pour les autres scripts
return $Users
