Get-ADUser -Filter * -Server "DC300141550.local" -Properties Name, SamAccountName, Enabled | Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
