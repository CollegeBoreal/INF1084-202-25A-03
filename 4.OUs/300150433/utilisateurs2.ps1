Import-Module ActiveDirectory

$domainName = "dc300150433-00.local"

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
    Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
    Select-Object Name, SamAccountName
