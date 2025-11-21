Import-Module ActiveDirectory

Get-ADUser -Filter * -Server "DC300151556-00.local" -Properties Name, SamAccountName, Enabled `
| Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } `
| Select-Object Name, SamAccountName
