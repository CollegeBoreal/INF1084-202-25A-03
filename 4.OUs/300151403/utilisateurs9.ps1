Get-ADUser -Filter * -Server "DC-300151403-00.local" -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator", "Guest", "krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "C:\Users\300151403\INF1084-202-25A-03\4.OUs\300151403\TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
