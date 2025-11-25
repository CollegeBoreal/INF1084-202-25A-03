# Définir les utilisateurs
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)

# Créer le groupe vide
$Groups = @{}

$csvPath = "C:\Temp\UsersSimules.csv"

# Exporter les utilisateurs
$Users | Export-Csv -Path $csvPath -NoTypeInformation
Write-Host "✅ Export CSV terminé : $csvPath"

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path $csvPath
Write-Host "`n📌 Utilisateurs importés depuis CSV :"
$ImportedUsers | ForEach-Object { Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# Créer un groupe "ImportGroupe" et y ajouter tous les utilisateurs importés
$Groups["ImportGroupe"] = $ImportedUsers
Write-Host "`n📌 Utilisateurs dans ImportGroupe :"
$Groups["ImportGroupe"] | ForEach-Object { Write-Host "$($_.Prenom) $($_.Nom)" }

