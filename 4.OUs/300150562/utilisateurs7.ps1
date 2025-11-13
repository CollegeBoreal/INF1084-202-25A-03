# utilisateurs7.ps1
Write-Host "=== RECHERCHE UTILISATEURS AVEC FILTRES ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory

Write-Host "`n Recherche prénom commençant par 'A'..." -ForegroundColor Cyan
$usersA = Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName, GivenName, Surname, Enabled |
    Select-Object Name, SamAccountName, GivenName, Surname, Enabled

if ($usersA.Count -gt 0) {
    Write-Host " $($usersA.Count) utilisateur(s) trouvé(s):" -ForegroundColor Green
    $usersA | Format-Table -AutoSize
} else {
    Write-Host "ℹ Aucun utilisateur trouvé" -ForegroundColor Yellow
}

Write-Host "`n Recherche nom commençant par 'C'..." -ForegroundColor Cyan
$usersC = Get-ADUser -Filter "Surname -like 'C*'" -Properties Name, SamAccountName, GivenName, Surname, Enabled |
    Select-Object Name, SamAccountName, GivenName, Surname, Enabled

if ($usersC.Count -gt 0) {
    Write-Host " $($usersC.Count) utilisateur(s) trouvé(s):" -ForegroundColor Green
    $usersC | Format-Table -AutoSize
} else {
    Write-Host "ℹ Aucun utilisateur trouvé" -ForegroundColor Yellow
}

Write-Host "`n Terminé!" -ForegroundColor Green
