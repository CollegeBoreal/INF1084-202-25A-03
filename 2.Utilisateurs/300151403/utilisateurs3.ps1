
# Créer des utilisateurs avec une propriété OU
$Users = @(
    [PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Age=28; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Martin"; Prenom="Claire"; Age=32; OU="Professeurs"},
    [PSCustomObject]@{Nom="Diallo"; Prenom="Ibrahima"; Age=40; OU="Professeurs"},
    [PSCustomObject]@{Nom="Bernard"; Prenom="Benoit"; Age=22; OU="Stagiaires"},
    [PSCustomObject]@{Nom="Balde"; Prenom="Fatou"; Age=26; OU="Stagiaires"}
)

# 1️⃣ Lister tous les utilisateurs dont le Nom commence par "B"
$Users | Where-Object { $_.Nom -like "B*" } | Format-Table Nom, Prenom, Age, OU

# 2️⃣ Lister tous les utilisateurs dans l'OU "Stagiaires"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | Format-Table Nom, Prenom, Age, OU

