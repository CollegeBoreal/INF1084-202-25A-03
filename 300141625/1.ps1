# Script 1 - Création d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

Write-Host "=== UTILISATEURS CRÉÉS ==="
$Users | ForEach-Object { 
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login)" 
}
