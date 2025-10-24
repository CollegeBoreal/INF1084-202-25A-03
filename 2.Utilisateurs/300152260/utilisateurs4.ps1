# Importer le script utilisateurs1.ps1
. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Définir le chemin du fichier CSV RELATIF au script
$CsvPath = "$PSScriptRoot\file_utilisateurs1.csv"

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
