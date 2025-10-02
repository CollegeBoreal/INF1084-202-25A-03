# Définir le chemin du fichier CSV
$CsvPath = "C:\Users\PC\Developer\INF1084-202-25A-03\2.Utilisateurs\300151556\file_user1.csv"

# Créer le dossier si nécessaire
$CsvFolder = Split-Path $CsvPath
if (-not (Test-Path $CsvFolder)) {
    New-Item -ItemType Directory -Path $CsvFolder -Force | Out-Null
}

# Exporter $Users vers un fichier CSV
$Users | Export-Csv -Path $CsvPath -NoTypeInformation
Write-Host "`nImportation des utilisateurs depuis : $CsvPath `n"

# Importer les utilisateurs depuis le CSV
$UsersImportes = Import-Csv -Path $CsvPath

# Vérifier que le CSV contient des utilisateurs
if (-not $UsersImportes) {
    Write-Host "Aucun utilisateur trouvé dans le CSV."
    return
}

# Créer le groupe "ImportGroupe" sous forme de tableau vide
$ImportGroupe = @()

# Ajouter tous les utilisateurs importés au groupe
$ImportGroupe += $UsersImportes

# Afficher les membres du groupe
Write-Host "Membres du groupe ImportGroupe `n"
$ImportGroupe | Format-Table Prenom, Nom, Login, OU -AutoSize

