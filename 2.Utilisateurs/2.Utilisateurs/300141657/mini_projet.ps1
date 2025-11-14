# Mini-projet : simulation AD - Version améliorée

# Étape 1 : créer 5 utilisateurs dans OU Promo2025
$Users = @(
    @{Nom="Tremblay"; Prenom="Alice"; Login="atremblay"; OU="Promo2025"},
    @{Nom="Gagnon"; Prenom="Bob"; Login="bgagnon"; OU="Promo2025"},
    @{Nom="Roy"; Prenom="Charlie"; Login="croy"; OU="Promo2025"},
    @{Nom="Cote"; Prenom="Diana"; Login="dcote"; OU="Promo2025"},
    @{Nom="Nguyen"; Prenom="Linh"; Login="lnguyen"; OU="Promo2025"}
)

# Afficher les utilisateurs créés
Write-Host "=== UTILISATEURS CREES ===" -ForegroundColor Green
$Users | ForEach-Object { 
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login)" 
}

# Étape 2 : créer le groupe Etudiants2025
$Groups = @{
    "Etudiants2025" = @()
}

# Étape 3 : ajouter tous les utilisateurs de Promo2025 dans le groupe
foreach ($user in $Users) {
    if ($user.OU -eq "Promo2025") {
        $Groups["Etudiants2025"] += $user
    }
}

Write-Host "`n=== MEMBRES DU GROUPE ===" -ForegroundColor Yellow
$Groups["Etudiants2025"] | ForEach-Object { 
    "$($_.Prenom) $($_.Nom)" 
}

# Étape 4 : exporter en CSV
$ExportPath = "C:\Temp\Etudiants2025.csv"

# Créer le dossier si nécessaire
if (!(Test-Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp" -Force
}

# Exporter
$Groups["Etudiants2025"] | Export-Csv -Path $ExportPath -NoTypeInformation

Write-Host "`n✅ Groupe Etudiants2025 créé et exporté dans $ExportPath" -ForegroundColor Green

# Vérification (VERSION SIMPLIFIÉE)
if (Test-Path $ExportPath) {
    Write-Host "Fichier CSV créé avec succès!" -ForegroundColor Cyan
}