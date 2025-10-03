# Utilisateurs2.ps1 - Filtrage des utilisateurs
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

Write-Host "=== FILTRES ===" -ForegroundColor Yellow
Write-Host "Noms commençant par B:" -ForegroundColor Cyan
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }

Write-Host "`nTous les stagiaires:" -ForegroundColor Cyan
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }
