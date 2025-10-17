# utilisateurs4.ps1
# Exercice 4 : Importer le fichier CSV et créer un groupe "ImportGroupe" en ajoutant tous les utilisateurs importés

# Liste des utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Moreau"; Prenom="Thomas"; Login="tmoreau"; OU="Stagiaires"},
    @{Nom="Chen"; Prenom="Wei"; Login="wchen"; OU="Stagiaires"}
)

# Étape 1 : Exporter les utilisateurs vers CSV
Write-Host "=== EXPORT VERS CSV ===" -ForegroundColor Yellow

# Créer le dossier Temp s'il n'existe pas
$dossierTemp = "C:\Temp"
if (-not (Test-Path $dossierTemp)) {
    New-Item -ItemType Directory -Path $dossierTemp -Force
    Write-Host "Dossier C:\Temp cree" -ForegroundColor Green
}

# Exporter vers CSV
$cheminCSV = "C:\Temp\UsersSimules.csv"
$Users | Export-Csv -Path $cheminCSV -NoTypeInformation -Delimiter ";"
Write-Host "Fichier CSV exporte : $cheminCSV" -ForegroundColor Green

# Afficher le contenu du fichier exporté
Write-Host "`nContenu du fichier CSV :" -ForegroundColor Cyan
Get-Content $cheminCSV

# Étape 2 : Importer depuis CSV
Write-Host "`n=== IMPORT DEPUIS CSV ===" -ForegroundColor Yellow
$ImportedUsers = Import-Csv -Path $cheminCSV -Delimiter ";"

Write-Host "Nombre d'utilisateurs importes : $($ImportedUsers.Count)" -ForegroundColor Green
$ImportedUsers | ForEach-Object {
    Write-Host "Importe: $($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Étape 3 : Créer le groupe "ImportGroupe" et ajouter tous les utilisateurs importés
Write-Host "`n=== CREATION DU GROUPE IMPORTGROUPE ===" -ForegroundColor Magenta

# Créer la structure des groupes
$Groups = @{
    "ImportGroupe" = @()
    "AutresGroupes" = @()
}

# Ajouter tous les utilisateurs importés dans "ImportGroupe"
$Groups["ImportGroupe"] = $ImportedUsers

# Afficher les membres du groupe
Write-Host "`n=== MEMBRES DU GROUPE IMPORTGROUPE ===" -ForegroundColor Green
Write-Host "Nombre de membres : $($Groups['ImportGroupe'].Count)" -ForegroundColor Cyan

$Groups["ImportGroupe"] | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))" -ForegroundColor White
}

# Vérification finale
Write-Host "`n=== VERIFICATION FINALE ===" -ForegroundColor Blue
Write-Host "Fichier CSV existe : $(Test-Path $cheminCSV)" -ForegroundColor White
Write-Host "Utilisateurs exportes : $($Users.Count)" -ForegroundColor White
Write-Host "Utilisateurs importes : $($ImportedUsers.Count)" -ForegroundColor White
Write-Host "Membres dans ImportGroupe : $($Groups['ImportGroupe'].Count)" -ForegroundColor White
