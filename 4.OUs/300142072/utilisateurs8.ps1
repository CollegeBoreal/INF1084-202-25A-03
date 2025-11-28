Import-Module ActiveDirectory

Get-ADUser -Filter "GivenName -like 'S*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
