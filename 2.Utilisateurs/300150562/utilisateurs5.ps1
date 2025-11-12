# Mini-projet : Script complet de simulation AD
# utilisateurs5.ps1

Write-Host "=== MINI-PROJET : SIMULATION ACTIVE DIRECTORY ===" -ForegroundColor Cyan
Write-Host "Création d'utilisateurs, groupes et export CSV" -ForegroundColor Cyan
Write-Host ""

# Étape 1 : Créer 5 utilisateurs simulés dans l'OU "Promo2025"
Write-Host "ÉTAPE 1 : Création des utilisateurs dans l'OU 'Promo2025'" -ForegroundColor Green
$Users = @(
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Promo2025"; Email="lmoreau@ecole.fr"},
    @{Nom="Garcia"; Prenom="Emma"; Login="egarcia"; OU="Promo2025"; Email="egarcia@ecole.fr"},
    @{Nom="Petit"; Prenom="Hugo"; Login="hpetit"; OU="Promo2025"; Email="hpetit@ecole.fr"},
    @{Nom="Roux"; Prenom="Léa"; Login="lroux"; OU="Promo2025"; Email="lroux@ecole.fr"},
    @{Nom="Fournier"; Prenom="Thomas"; Login="tfournier"; OU="Promo2025"; Email="tfournier@ecole.fr"}
)

Write-Host "Utilisateurs créés :" -ForegroundColor Yellow
$Users | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login)) - OU: $($_.OU)" 
}

# Étape 2 : Créer un groupe "Etudiants2025"
Write-Host "`nÉTAPE 2 : Création du groupe 'Etudiants2025'" -ForegroundColor Green
$Groups = @{
    "Etudiants2025" = @()
}

Write-Host "Groupe créé : Etudiants2025" -ForegroundColor Yellow

# Étape 3 : Ajouter tous les utilisateurs de "Promo2025" dans le groupe
Write-Host "`nÉTAPE 3 : Ajout des utilisateurs de 'Promo2025' au groupe 'Etudiants2025'" -ForegroundColor Green
$UsersPromo2025 = $Users | Where-Object { $_.OU -eq "Promo2025" }

foreach ($User in $UsersPromo2025) {
    $Groups["Etudiants2025"] += $User
}

Write-Host "Membres ajoutés au groupe Etudiants2025 :" -ForegroundColor Yellow
$Groups["Etudiants2025"] | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))"
}

# Étape 4 : Exporter la liste finale du groupe en CSV
Write-Host "`nÉTAPE 4 : Export de la liste du groupe en CSV" -ForegroundColor Green

# Créer le dossier d'export s'il n'existe pas
$ExportPath = "C:\Temp"
if (!(Test-Path $ExportPath)) {
    New-Item -ItemType Directory -Path $ExportPath -Force
    Write-Host "Dossier $ExportPath créé" -ForegroundColor Yellow
}

# Exporter la liste du groupe
$ExportFile = "$ExportPath\Groupe_Etudiants2025.csv"
$Groups["Etudiants2025"] | Export-Csv -Path $ExportFile -NoTypeInformation -Encoding UTF8

Write-Host "Fichier exporté : $ExportFile" -ForegroundColor Yellow

# Afficher un résumé final
Write-Host "`n=== RÉSUMÉ FINAL ===" -ForegroundColor Cyan
Write-Host "Utilisateurs créés : $($Users.Count)" -ForegroundColor White
Write-Host "Membres dans Etudiants2025 : $($Groups['Etudiants2025'].Count)" -ForegroundColor White
Write-Host "Fichier CSV généré : $ExportFile" -ForegroundColor White

# Vérification : Afficher le contenu du fichier CSV
Write-Host "`nContenu du fichier CSV exporté :" -ForegroundColor Magenta
Get-Content $ExportFile | ForEach-Object { Write-Host $_ }

# Optionnel : Importer et vérifier les données exportées
Write-Host "`nVérification par réimportation du CSV :" -ForegroundColor DarkYellow
$ImportedData = Import-Csv $ExportFile
$ImportedData | ForEach-Object {
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))"
}