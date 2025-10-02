<<<<<<< HEAD
﻿# utilisateurs1.ps1 - Script 1
Write-Host "=== SCRIPT 1 : CREATION D'UTILISATEURS ===" -ForegroundColor Green

=======
﻿# Utilisateurs1.ps1 - Création d'utilisateurs simulés
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
<<<<<<< HEAD
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Stagiaires"},
    @{Nom="Petit"; Prenom="Marie"; Login="mpetit"; OU="Formateurs"}
)

Write-Host "Liste des utilisateurs crees :" -ForegroundColor Yellow
$Users | ForEach-Object { 
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" 
}

Write-Host "`nAppuyez sur Entree pour continuer..." -ForegroundColor Cyan
pause
=======
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

Write-Host "=== LISTE DES UTILISATEURS ===" -ForegroundColor Green
$Users | ForEach-Object { 
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" 
}
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
