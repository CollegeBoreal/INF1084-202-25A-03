<<<<<<< HEAD
﻿# utilisateurs2.ps1 - Script 2
Write-Host "=== SCRIPT 2 : GROUPES ET STAGIAIRES ===" -ForegroundColor Yellow

=======
﻿# Utilisateurs2.ps1 - Filtrage des utilisateurs
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
<<<<<<< HEAD
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Stagiaires"},
    @{Nom="Petit"; Prenom="Marie"; Login="mpetit"; OU="Formateurs"}
)

$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

$Stagiaires = $Users | Where-Object {$_.OU -eq "Stagiaires"}
foreach ($Stagiaire in $Stagiaires) {
    $Groups["GroupeFormation"] += $Stagiaire
}

Write-Host "Membres ajoutes au GroupeFormation :" -ForegroundColor Green
$Groups["GroupeFormation"] | ForEach-Object { 
    "$($_.Prenom) $($_.Nom)" 
}

Write-Host "`nAppuyez sur Entree pour continuer..." -ForegroundColor Cyan
pause
=======
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

Write-Host "=== FILTRES ===" -ForegroundColor Yellow
Write-Host "Noms commençant par B:" -ForegroundColor Cyan
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }

Write-Host "`nTous les stagiaires:" -ForegroundColor Cyan
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
