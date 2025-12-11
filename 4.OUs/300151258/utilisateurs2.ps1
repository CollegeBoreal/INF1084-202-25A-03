<<<<<<< HEAD
Get-ADUser -Filter * -Server "dc300151258-00.local" -Properties Name, SamAccountName, Enabled |
=======
$domainName = "dc300151258-00.local"

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
>>>>>>> e531e11938a31f19675ed2afb245165b0b97d956
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
