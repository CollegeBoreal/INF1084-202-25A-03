# Utilisateurs1.ps1 - Création d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

Write-Host "=== LISTE DES UTILISATEURS ===" -ForegroundColor Green
$Users | ForEach-Object { 
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" 
}
