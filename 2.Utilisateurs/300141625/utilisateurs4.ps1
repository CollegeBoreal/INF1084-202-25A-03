# Utilisateurs4.ps1 - Export/Import CSV
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

# Export CSV
$Users | Export-Csv -Path "UsersSimules.csv" -NoTypeInformation
Write-Host "Fichier CSV exporté: UsersSimules.csv" -ForegroundColor Green

# Import CSV
$ImportedUsers = Import-Csv -Path "UsersSimules.csv"
Write-Host "`nUtilisateurs importés:" -ForegroundColor Yellow
$ImportedUsers | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }
