# ============================================================
# utilisateurs1.ps1
# Préparation, vérification du domaine, listing utilisateurs
# ============================================================

. ./bootstrap.ps1   # Charger les variables

Import-Module ActiveDirectory

Write-Host "=== Vérification du domaine ==="
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

Write-Host "=== Liste des utilisateurs actifs ==="
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

