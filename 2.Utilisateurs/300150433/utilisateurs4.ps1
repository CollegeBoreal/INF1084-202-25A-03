# Exporter les utilisateurs simulés
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation
Write-Host "Les utilisateurs ont été exportés vers C:\Temp\UsersSimules.csv"

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"
Write-Host "`nUtilisateurs importés depuis le CSV :"
$ImportedUsers | ForEach-Object { Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# Exercice 4 : Créer un groupe "ImportGroupe" et ajouter tous les utilisateurs importés
$Groups = @{
    "ImportGroupe" = @()
}

foreach ($user in $ImportedUsers) {
    $Groups["ImportGroupe"] += $user
}

# Afficher les membres du groupe
Write-Host "`nMembres du groupe ImportGroupe :"
$Groups["ImportGroupe"] | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
