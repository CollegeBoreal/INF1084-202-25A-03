<# =========================================================
corneil (DC-300150562-00)
Rapport Trust Active Directory
========================================================= #>

Import-Module ActiveDirectory

$LocalDomain  = "DC-300150562-00.local"
$RemoteDomain = "DC-300141657-00.local"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $LocalDomain
Resolve-DnsName $RemoteDomain

Write-Host "=== 2. Vérifier le module ActiveDirectory ==="
Get-Module -ListAvailable ActiveDirectory

Write-Host "=== 3. Informations de la forêt ==="
Get-ADForest | Select-Object Name, Domains, ForestMode

Write-Host "=== 4. Informations du système ==="
hostname
ipconfig /all | findstr /i "Primary"
wmic computersystem get domain

Write-Host "=== 5. Créer le trust bidirectionnel ==="
netdom trust $LocalDomain /Domain:$RemoteDomain `
    /UserD:administrator /PasswordD:* `
    /Add /Realm /TwoWay

Write-Host "=== 6. Trusts configurés ==="
Get-ADTrust -Filter * | Select-Object Name, Direction, TrustType

Write-Host "=== 7. Vérifier le trust ==="
netdom trust $LocalDomain /Domain:$RemoteDomain /verify

Write-Host "=== Script terminé ==="
