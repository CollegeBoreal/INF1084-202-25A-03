Get-ADUser -Filter * -Server "DC300147816.local" -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "C:\Users\Student1\INF1084-202-25A-03\4.OUs\300147816\TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
