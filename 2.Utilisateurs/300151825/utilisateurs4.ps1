# utilisateurs4.ps1

# Création du dossier C:\Temp s'il n'existe pas
if (-not (Test-Path "C:\Temp")) {
    New-Item -Path "C:\Temp" -ItemType Directory | Out-Null
}

# Exporter les utilisateurs simulés
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"

# Créer un nouveau groupe "ImportGroupe" et y ajouter tous les utilisateurs importés
$Groups = @{
    "ImportGroupe" = @()
}
$Groups["ImportGroupe"] += $ImportedUsers

# Afficher le groupe importé
$Groups["ImportGroupe"] | ForEach-Object { "$($_.Prenom) $($_.Nom)" }
