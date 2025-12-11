. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
