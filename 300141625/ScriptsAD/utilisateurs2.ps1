# utilisateurs2.ps1 - Script 2
Write-Host "=== SCRIPT 2 : GROUPES ET STAGIAIRES ===" -ForegroundColor Yellow

$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
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
