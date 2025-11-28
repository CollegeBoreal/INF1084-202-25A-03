Import-Module ActiveDirectory

$studentNumber = 300142072
$studentInstance = 20
$domainName = "DC$studentNumber-$studentInstance.local"

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
