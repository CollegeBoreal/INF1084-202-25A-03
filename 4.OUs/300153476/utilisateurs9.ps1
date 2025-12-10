. .\bootstrap.ps1

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator", "Guest", "krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "C:.\TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
