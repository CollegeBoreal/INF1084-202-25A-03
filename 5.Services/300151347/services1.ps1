# Afficher uniquement les services associés à Active Directory
Get-Service | Where-Object {
    $_.Name -match "NTDS|ADWS|DFSR|KDC|Netlogon|IsmServ" -or
    $_.DisplayName -match "Directory|Active"
} | Select-Object Name, DisplayName, Status |
Sort-Object Name

# Vérifier l'état de quelques services AD importants
Get-Service -Name "NTDS","Netlogon","KDC"
