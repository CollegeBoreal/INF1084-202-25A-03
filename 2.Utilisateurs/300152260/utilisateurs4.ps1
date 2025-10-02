# Importer les utilisateurs
. "$PSScriptRoot\utilisateurs1.ps1"

# Définir le chemin du CSV dans le même dossier que le script
$CsvPath = "$PSScriptRoot\file_utilisateurs1.csv"

# Exporter les utilisateurs vers CSV
$Users | Export-Csv -Path $CsvPath -NoTypeInformation

# Importer les utilisateurs depuis CSV
$UsersImportes = Import-Csv -Path $CsvPath

# Afficher les utilisateurs importés
$UsersImportes