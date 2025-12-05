# utilisateurs3.ps1
. ./bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== Delete user alice.dupont ==="

Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred
Write-Host "User deleted if existed"

Write-Host "=== Search users starting with A ==="

Get-ADUser -Filter "GivenName -like 'A*'" -Properties SamAccountName |
Select-Object Name, SamAccountName

Write-Host "=== Export all users to CSV ==="

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

Write-Host "CSV exported: TP_AD_Users.csv"

Write-Host "=== END utilisateurs3.ps1 ==="

