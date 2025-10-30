# utilisateurs4.ps1 - Export/Import CSV et création d'un groupe

# Charger les utilisateurs depuis utilisateurs1.ps1 (si besoin)
. .\utilisateurs1.ps1

# Transformer les hash tables en objets PowerShell pour export CSV
$UsersObj = $Users | ForEach-Object {
    [PSCustomObject]@{
        Nom    = $_.Nom
        Prenom = $_.Prenom
        Login  = $_.Login
        OU     = $_.OU
    }
}

# Exporter les utilisateurs dans un CSV
$UsersObj | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"

# Créer un groupe ImportGroupe
$Groups = @{
    "ImportGroupe" = @()
}

# Ajouter tous les utilisateurs importés dans ImportGroupe
$Groups["ImportGroupe"] += $ImportedUsers

# Afficher les membres du groupe ImportGroupe
Write-Output "=== Membres du groupe ImportGroupe ==="
$Groups["ImportGroupe"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

