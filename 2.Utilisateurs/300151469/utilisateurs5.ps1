# utilisateurs5.ps1 - Mini-projet : simulation complète

# Créer 5 utilisateurs simulés dans l'OU "Promo2025"
$UsersPromo = @(
    [PSCustomObject]@{Nom="Dupont";      Prenom="Alice";  Login="adupont";      OU="Promo2025"},
    [PSCustomObject]@{Nom="Lemoine";     Prenom="Sarah";  Login="slemoine";     OU="Promo2025"},
    [PSCustomObject]@{Nom="Benali";      Prenom="Karim";  Login="kbenali";      OU="Promo2025"},
    [PSCustomObject]@{Nom="Bouhali";     Prenom="Rabia";  Login="rbouhali";     OU="Promo2025"},
    [PSCustomObject]@{Nom="Ait Benour";  Prenom="Wafi";   Login="waitbenour";   OU="Promo2025"}
)

# Créer le groupe Etudiants2025
$Groups = @{
    "Etudiants2025" = @()
}

# Ajouter tous les utilisateurs de Promo2025 dans le groupe
$Groups["Etudiants2025"] += $UsersPromo | Where-Object { $_.OU -eq "Promo2025" }

# Afficher les membres du groupe
Write-Output "=== Membres du groupe Etudiants2025 ==="
$Groups["Etudiants2025"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Exporter le groupe final vers CSV
# Créer le dossier C:\Temp s'il n'existe pas
if (-not (Test-Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp" | Out-Null
}

$Groups["Etudiants2025"] | Export-Csv -Path "C:\Temp\Etudiants2025.csv" -NoTypeInformation
Write-Output " Export terminé : C:\Temp\Etudiants2025.csv"

