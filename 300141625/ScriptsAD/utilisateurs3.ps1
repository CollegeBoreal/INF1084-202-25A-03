# utilisateurs3.ps1 - Script 3
Write-Host "=== SCRIPT 3 : FILTRES ET RECHERCHE ===" -ForegroundColor Magenta

$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Stagiaires"},
    @{Nom="Petit"; Prenom="Marie"; Login="mpetit"; OU="Formateurs"}
)

Write-Host "1. Utilisateurs avec nom commencant par 'B' :" -ForegroundColor Yellow
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object { 
    "$($_.Prenom) $($_.Nom)" 
}

Write-Host "`n2. Utilisateurs dans l'OU 'Stagiaires' :" -ForegroundColor Cyan
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object { 
    "$($_.Prenom) $($_.Nom)" 
}

Write-Host "`n3. Utilisateurs avec 'a' dans le prenom :" -ForegroundColor Green
$UsersWithA = $Users | Where-Object {$_.Prenom -match "a"}
$UsersWithA | ForEach-Object { "$($_.Prenom) $($_.Nom)" }

Write-Host "`nAppuyez sur Entree pour continuer..." -ForegroundColor Cyan
pause
