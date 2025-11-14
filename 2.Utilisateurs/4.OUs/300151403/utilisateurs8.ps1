Get-ADUser -Filter "GivenName -like 'B*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
