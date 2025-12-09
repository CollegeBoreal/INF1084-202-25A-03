# Auto-détection du domaine AD
$domain = (Get-ADDomain).DNSRoot

# Export
Get-ADUser -Filter * -Server $domain -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

# Vérification du fichier
if (Test-Path "TP_AD_Users.csv") {
    $count = (Import-Csv "TP_AD_Users.csv").Count
    if ($count -gt 0) {
        Write-Host "Export terminé avec succès ! $count utilisateurs ont été enregistrés dans TP_AD_Users.csv." -ForegroundColor Green
    } else {
        Write-Host "Le fichier TP_AD_Users.csv a été créé, mais il est vide." -ForegroundColor Yellow
    }
} else {
    Write-Host "Erreur : le fichier TP_AD_Users.csv n'a pas été créé." -ForegroundColor Red
}

