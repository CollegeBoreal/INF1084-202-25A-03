<# =========================================================
 Script utilisateurs3.ps1 – Export CSV
========================================================= #>

. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== Exportation des utilisateurs du domaine ==="

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

Write-Host "CSV généré : TP_AD_Users.csv"

