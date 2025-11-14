Get-ADUser -Filter * -Server "DC-300151403-00.local" -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator", "Guest", "krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
