# Creer une liste d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Sidhom"; Prenom="Ikram"; Login="isidhom"; OU="Stagiaires"},   # Exercice 1
    @{Nom="Diarra"; Prenom="Siga"; Login="sdiarra"; OU="Stagiaires"}     # Exercice 1
)

# Afficher les utilisateurs
Write-Host "=== LISTE DES UTILISATEURS ===" -ForegroundColor Green
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }
