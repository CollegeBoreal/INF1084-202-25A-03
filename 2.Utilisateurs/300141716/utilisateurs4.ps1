# Charger les utilisateurs depuis utilisateur1.ps1
. "$PSScriptRoot\utilisateurs1.ps1"

# D�finir le chemin CSV dans le dossier du script pour �viter les erreurs
$CsvPath = "$PSScriptRoot\UsersSimules.csv"

# Exporter les utilisateurs
$Users | Export-Csv -Path $CsvPath -NoTypeInformation

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path $CsvPath

Write-Host "=== Utilisateurs import�s ===" -ForegroundColor Green
$ImportedUsers | Format-Table Prenom, Nom, Login, OU

# Cr�er un groupe et ajouter tous les utilisateurs import�s
$ImportGroupe = @()
$ImportGroupe += $ImportedUsers

Write-Host "=== Membres du ImportGroupe ===" -ForegroundColor Green
$ImportGroupe | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login)" }

