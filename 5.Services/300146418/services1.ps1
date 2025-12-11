# services1.ps1
# TP Services Windows / Active Directory
# Objectif : lister tous les services AD et vérifier leur état

Write-Host "Liste des services liés à Active Directory..." -ForegroundColor Cyan

# Lister tous les services liés à AD
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

Write-Host "Vérification de l'état des services principaux AD..." -ForegroundColor Cyan

# Vérifier l’état des principaux services AD
Get-Service -Name NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ

