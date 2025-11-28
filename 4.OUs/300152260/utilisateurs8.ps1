
Get-ADUser -Filter "GivenName -like 'W*'" -Properties Name, MohAccountName |
Select-Object Name, MohAccountName
