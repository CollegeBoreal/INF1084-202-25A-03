# utilisateurs5.ps1
# Mini-projet : script complet de simulation AD

Write-Host "=== MINI-PROJET : SIMULATION ACTIVE DIRECTORY ===" -ForegroundColor Magenta

# Étape 1 : Créer 5 utilisateurs simulés dans l'OU "Promo2025"
Write-Host "`n=== ETAPE 1 : CREATION DES UTILISATEURS ===" -ForegroundColor Yellow

$Users = @(
    @{Nom="Martin"; Prenom="Luc"; Login="lmartin"; OU="Promo2025"; Email="luc.martin@ecole.com"},
    @{Nom="Bernard"; Prenom="Marie"; Login="mbernard"; OU="Promo2025"; Email="marie.bernard@ecole.com"},
    @{Nom="Dubois"; Prenom="Pierre"; Login="pdubois"; OU="Promo2025"; Email="pierre.dubois@ecole.com"},
    @{Nom="Robert"; Prenom="Sophie"; Login="srobert"; OU="Promo2025"; Email="sophie.robert@ecole.com"},
    @{Nom="Petit"; Prenom="Jean"; Login="jpetit"; OU="Promo2025"; Email="jean.petit@ecole.com"}
)

Write-Host "5 utilisateurs crees dans l'OU 'Promo2025'" -ForegroundColor Green
$Users | ForEach-Object {
    Write-Host "  - $($_.Prenom) $($_.Nom) (Login: $($_.Login))" -ForegroundColor White
}

# Étape 2 : Créer le groupe "Etudiants2025"
Write-Host "`n=== ETAPE 2 : CREATION DU GROUPE ===" -ForegroundColor Yellow

$Groups = @{
    "Etudiants2025" = @()
}

Write-Host "Groupe 'Etudiants2025' cree" -ForegroundColor Green

# Étape 3 : Ajouter tous les utilisateurs de "Promo2025" dans le groupe
Write-Host "`n=== ETAPE 3 : AJOUT AU GROUPE ===" -ForegroundColor Yellow

$utilisateursPromo2025 = $Users | Where-Object { $_.OU -eq "Promo2025" }
$Groups["Etudiants2025"] = $utilisateursPromo2025

Write-Host "$($utilisateursPromo2025.Count) utilisateurs ajoutes au groupe 'Etudiants2025'" -ForegroundColor Green

# Afficher les membres du groupe
Write-Host "`n=== MEMBRES DU GROUPE ETUDIANTS2025 ===" -ForegroundColor Cyan
$Groups["Etudiants2025"] | ForEach-Object {
    Write-Host "  - $($_.Prenom) $($_.Nom) ($($_.Login))" -ForegroundColor White
}

# Étape 4 : Exporter la liste finale du groupe en CSV
Write-Host "`n=== ETAPE 4 : EXPORT CSV ===" -ForegroundColor Yellow

$dossierExport = "C:\ExportAD"
if (-not (Test-Path $dossierExport)) {
    New-Item -ItemType Directory -Path $dossierExport -Force
    Write-Host "Dossier d'export cree : $dossierExport" -ForegroundColor Green
}

$cheminCSV = "$dossierExport\Etudiants2025.csv"
$Groups["Etudiants2025"] | Export-Csv -Path $cheminCSV -NoTypeInformation -Delimiter ";"
Write-Host "Liste exportee vers : $cheminCSV" -ForegroundColor Green

Write-Host "`n=== APERCU DU FICHIER CSV ===" -ForegroundColor Cyan
Get-Content $cheminCSV | ForEach-Object { Write-Host "  $_" }

Write-Host "`n=== RESUME DU MINI-PROJET ===" -ForegroundColor Magenta
Write-Host "Utilisateurs crees     : $($Users.Count)" -ForegroundColor White
Write-Host "Groupes crees         : $($Groups.Count)" -ForegroundColor White
Write-Host "Membres dans le groupe : $($Groups['Etudiants2025'].Count)" -ForegroundColor White
Write-Host "Fichier CSV genere    : $cheminCSV" -ForegroundColor White

Write-Host "`n=== MINI-PROJET TERMINE AVEC SUCCES ===" -ForegroundColor Green
