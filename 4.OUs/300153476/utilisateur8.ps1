. ./utilisateur7.ps1 
Get-ADUser -Filter "GivenName -like 'R*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccount 
