# utilisateurs1.ps1 - Script 1
Write-Host "=== SCRIPT 1 : CREATION D'UTILISATEURS ===" -ForegroundColor Green

$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Stagiaires"},
    @{Nom="Petit"; Prenom="Marie"; Login="mpetit"; OU="Formateurs"}
)

Write-Host "Liste des utilisateurs crees :" -ForegroundColor Yellow
$Users | ForEach-Object { 
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" 
}

Write-Host "`nAppuyez sur Entree pour continuer..." -ForegroundColor Cyan
pause
