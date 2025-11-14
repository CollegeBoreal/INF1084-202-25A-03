# utilisateurs4.ps1

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

