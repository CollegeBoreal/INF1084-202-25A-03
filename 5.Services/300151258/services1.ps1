# Lister tous les services liés à AD
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

# Vérifier e statut d'un service spécifique
<<<<<<< HEAD
Get-Service -Name NTDS, ADWS, DFSR
=======
Get-Service -Name NTDS, ADWS, DFSR
>>>>>>> 177771b0b8cd541ce1ff346638c8a59e34ec2d42
