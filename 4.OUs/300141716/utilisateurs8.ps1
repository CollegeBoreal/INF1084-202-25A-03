# 8. Rechercher des utilisateurs avec un filtre
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== RECHERCHE D'UTILISATEURS (PRÉNOM COMMENÇANT PAR 'A') ===" -ForegroundColor Yellow

Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName |
Format-Table -AutoSize
