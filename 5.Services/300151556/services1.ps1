# services1.ps1
# Objectif : Lister tous les services liés à Active Directory et vérifier leur état.

Write-Host "=== Liste des services Active Directory ===" -ForegroundColor Cyan

# Lister les services en lien avec Active Directory
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName | Format-Table Name, Status, DisplayName -AutoSize

Write-Host "`n=== État des services AD principaux ===" -ForegroundColor Cyan

# Vérifier l’état des services AD les plus importants
Get-Service -Name NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ | 
    Format-Table Name, Status, DisplayName -AutoSize
