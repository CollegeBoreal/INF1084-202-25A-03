# Script 4 - Export/Import CSV
$Users = @(
    [PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

# Export CSV
$Users | Export-Csv -Path "UsersSimules.csv" -NoTypeInformation
Write-Host "Fichier CSV exporté: UsersSimules.csv"

# Import CSV
$ImportedUsers = Import-Csv -Path "UsersSimules.csv"
Write-Host "`nUtilisateurs importés:"
$ImportedUsers | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))"
}
