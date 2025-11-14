# utilisateurs3.ps1

# Reprendre la liste d’utilisateurs
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Lucas"; Login="lmartin"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Sofia"; Login="snguyen"; OU="Stagiaires"}
)

# Exercice : Lister tous les utilisateurs dont le prénom contient "a"
$Users | Where-Object { $_.Prenom -match "a" }
