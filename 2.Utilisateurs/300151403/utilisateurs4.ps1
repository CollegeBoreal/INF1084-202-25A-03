# Construire un chemin relatif dans le dossier du script
$CsvPath = Join-Path -Path $PSScriptRoot -ChildPath "UsersSimules.csv"

# Export
$Users | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8

# Import
$ImportedUsers = Import-Csv -Path $CsvPath
$ImportedUsers | Format-Table Nom, Prenom, Age, OU

