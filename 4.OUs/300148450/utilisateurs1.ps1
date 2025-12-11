<# =========================================================
 Script utilisateurs1.ps1 – Liste des utilisateurs
 Domaine : DC300148450-00.local
========================================================= #>

# Charger les informations du bootstrap
. .\bootstrap.ps1

# Importer le module AD
Import-Module ActiveDirectory

Write-Host "=== Liste des utilisateurs du domaine ==="

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, Enabled

