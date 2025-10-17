# utilisateurs3.ps1
# Exercice 3 : Lister tous les utilisateurs dont le prénom contient "a" (majuscule/minuscule)

$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Moreau"; Prenom="Thomas"; Login="tmoreau"; OU="Stagiaires"},
    @{Nom="Chen"; Prenom="Wei"; Login="wchen"; OU="Stagiaires"}
)

Write-Host "=== EXERCICE 3 : UTILISATEURS AVEC 'a' DANS LE PRENOM ===" -ForegroundColor Yellow
$usersAvecA = $Users | Where-Object {$_.Prenom -like "*a*"}

Write-Host "Nombre d'utilisateurs trouves : $($usersAvecA.Count)" -ForegroundColor Green
$usersAvecA | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login)" -ForegroundColor White
}

Write-Host "`n=== VERIFICATION DETAILLEE ===" -ForegroundColor Magenta
foreach ($user in $Users) {
    $contientA = $user.Prenom -like "*a*"
    Write-Host "Prenom: $($user.Prenom) - Contient 'a': $contientA"
}
