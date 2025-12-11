
Get-ADUser -Filter "GivenName -like 'W*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

