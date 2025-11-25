Get-ADUser -Filter "GivenName -like 'k*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
