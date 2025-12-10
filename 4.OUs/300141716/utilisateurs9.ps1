# 9. Exporter les utilisateurs dans un CSV
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== EXPORT DES UTILISATEURS EN CSV ===" -ForegroundColor Yellow

$csvPath = "TP_AD_Users.csv"
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Write-Host "✅ Export CSV: $csvPath" -ForegroundColor Green
Write-Host "Contenu du fichier:" -ForegroundColor Cyan
Import-Csv $csvPath | Format-Table
