<<<<<<< HEAD:4.OUs/300148450/utilisateurs4.ps1
# utilisateurs4.ps1
. .\bootstrap.ps1

Write-Host "Recherche d'utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,DC=DC300148450-00,DC=local" |
Select Name, SamAccountName

Write-Host "Exporter les utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase "OU=Utilisateurs,DC=DC300148450-00,DC=local" |
Select Name, SamAccountName, Enabled |
Export-Csv -Path ".\export_utilisateurs.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Suppression d'un utilisateur..." -ForegroundColor Cyan
Remove-ADUser -Identity "marc.petit" -Confirm:$false -Credential $cred

=======
. .\bootstrap.ps1
Import-Module ActiveDirectory

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred
>>>>>>> 527495765984952f9723a6557b47a9b359ab761b:4.OUs/300142072/utilisateurs4.ps1
