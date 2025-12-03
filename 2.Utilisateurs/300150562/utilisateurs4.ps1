# Créer une liste d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Paul"; Login="pmartin"; OU="Stagiaires"},
    @{Nom="Bernard"; Prenom="Sophie"; Login="sbernard"; OU="Stagiaires"}
)

# Afficher les utilisateurs originaux
Write-Host "Utilisateurs originaux :" -ForegroundColor Green
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# Créer le dossier Temp s'il n'existe pas
$TempPath = "C:\Temp"
if (!(Test-Path $TempPath)) {
    New-Item -ItemType Directory -Path $TempPath -Force
    Write-Host "Dossier $TempPath créé" -ForegroundColor Yellow
}

# Exporter les utilisateurs simulés
$Users | Export-Csv -Path "$TempPath\UsersSimules.csv" -NoTypeInformation
Write-Host "`nFichier CSV exporté : $TempPath\UsersSimules.csv" -ForegroundColor Cyan

# Importer depuis CSV
$ImportedUsers = Import-Csv -Path "$TempPath\UsersSimules.csv"
Write-Host "`nUtilisateurs importés depuis CSV :" -ForegroundColor Yellow
$ImportedUsers | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# Exercice 4 : Créer un groupe "ImportGroupe" en ajoutant tous les utilisateurs importés
$Groups = @{
    "ImportGroupe" = @()
}

# Ajouter tous les utilisateurs importés au groupe
foreach ($User in $ImportedUsers) {
    $Groups["ImportGroupe"] += $User
}

# Afficher le contenu du groupe créé
Write-Host "`nExercice 4 - Groupe 'ImportGroupe' créé avec les utilisateurs importés :" -ForegroundColor Magenta
$Groups["ImportGroupe"] | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))" -ForegroundColor White
}

# Vérification du nombre d'utilisateurs dans le groupe
Write-Host "`nStatistiques :" -ForegroundColor Green
Write-Host "Nombre d'utilisateurs dans ImportGroupe : $($Groups['ImportGroupe'].Count)" -ForegroundColor White

# Afficher le contenu complet du fichier CSV pour vérification
Write-Host "`nContenu du fichier CSV :" -ForegroundColor DarkYellow
Get-Content "$TempPath\UsersSimules.csv" | ForEach-Object { Write-Host $_ }