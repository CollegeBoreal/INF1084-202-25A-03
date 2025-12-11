# utilisateurs4.ps1
. .\bootstrap.ps1

Write-Host "Recherche d'utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,DC=DC300148094-00,DC=local" |
Select Name, SamAccountName

Write-Host "Exporter les utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,DC=DC300148094-00,DC=local" |
Select Name, SamAccountName, Enabled |
Export-Csv -Path ".\export_utilisateurs.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Suppression d'un utilisateur..." -ForegroundColor Cyan
Remove-ADUser -Identity "marc.petit" -Confirm:$false 
