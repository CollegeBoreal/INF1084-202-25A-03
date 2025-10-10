# Utilisateurs3.ps1 - Filtres avancés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

Write-Host "=== FILTRES AVANCÉS ===" -ForegroundColor Yellow
Write-Host "Prénoms contenant 'a':" -ForegroundColor Cyan
$Users | Where-Object {$_.Prenom -match "a"} | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }
