# utilisateurs4.ps1

# Création d’utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Lucas"; Login="lmartin"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Sofia"; Login="snguyen"; OU="Stagiaires"}
)

# Export en CSV
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"

# Créer le groupe ImportGroupe et y ajouter tous les utilisateurs importés
$Groups = @{}
$Groups["ImportGroupe"] = @()
$Groups["ImportGroupe"] += $ImportedUsers

# Vérification
$Groups["ImportGroupe"]
