# Déclaration des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Déclaration des utilisateurs simulés
$Users = @(
    @{ Nom="Alice Dupont"; OU="Stagiaires" },
    @{ Nom="Bob Martin"; OU="Professeurs" },
    @{ Nom="Benoit Leroy"; OU="Stagiaires" },
    @{ Nom="Charlie Durand"; OU="Stagiaires" }
)

# Ajouter Alice dans GroupeFormation
$Groups["GroupeFormation"] += $Users[0]

# Exporter les utilisateurs simulés vers un CSV
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Importer les utilisateurs depuis le CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"

# Afficher les utilisateurs importés
$ImportedUsers

