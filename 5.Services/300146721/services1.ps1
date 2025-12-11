# Lister tous les services "liés à AD"
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

# Vérifier l’état de quelques services clés
Get-Service -Name NTDS, ADWS, DFSR
