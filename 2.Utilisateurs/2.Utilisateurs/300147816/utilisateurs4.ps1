. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Exporter les utilisateurs simulés
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"
Write-host "`n===voila la liste des utilisateurs importes"
$ImportedUsers|Format-Table



# Créer le groupe "ImportGroupe" et y ajouter tous les utilisateurs mportes
Write-host "`n=== Creer le groupe ImportGroupe en ajoutant les utilisateurs importes==="
$Groups = @{}

$Groups["ImportGroupe"] = $ImportedUsers

# Afficher le contenu du groupe
Write-host "`n===Groupe ImportGroupe==="
$Groups["ImportGroupe"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}


# Afficher le nombre d'utilisateurs dans le groupe
Write-Host "`nNombre d'utilisateurs dans ImportGroupe est : $($Groups['ImportGroupe'].Count)" -ForegroundColor Green




