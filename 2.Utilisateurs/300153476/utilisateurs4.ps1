# Charger les utilisateurs depuis le script précédent
. "$PSScriptRoot\utilisateurs3.ps1"

# Transformer les hash tables en objets PowerShell
$UsersObjects = $Users | ForEach-Object { [PSCustomObject]$_ }

# Définir le chemin du fichier CSV
$CsvPath = "C:\Users\300153476\INF1084-202-25A-03\2.Utilisateurs\300153476\UsersSimules.csv"

# Exporter les utilisateurs vers le CSV
$UsersObjects | Export-Csv -Path $CsvPath -NoTypeInformation
Write-Host "Fichier exporté vers : $CsvPath"

# Importer les utilisateurs depuis le CSV
$UsersImportes = Import-Csv -Path $CsvPath

# Vérifier que le CSV contient des utilisateurs
if (-not $UsersImportes) {
    Write-Host "Aucun utilisateur trouvé dans le CSV."
    return
}

# Créer le groupe "ImportGroupe"
$ImportGroupe = @()
$ImportGroupe += $UsersImportes

# Afficher les membres du groupe
Write-Host "`nMembres du groupe ImportGroupe :`n"
$ImportGroupe | Format-Table Prenom, Nom, Login, OU -AutoSize

