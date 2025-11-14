# Exercice 5 : Mini-projet complet - Simulation AD
# Réalisé par Amel Zourane - INF1084

# 🔹 Étape 1 : Créer les utilisateurs de la Promo2025
$Promo2025 = @(
    [PSCustomObject]@{Nom="Meziani"; Prenom="Lytissia"; Login="mlytissia"; OU="Promo2025"},
    [PSCustomObject]@{Nom="Zourane"; Prenom="Amel"; Login="amelz"; OU="Promo2025"},
    [PSCustomObject]@{Nom="Abed"; Prenom="Ines"; Login="inesa"; OU="Promo2025"},
    [PSCustomObject]@{Nom="Zerkani"; Prenom="Kahina"; Login="kzerkani"; OU="Promo2025"},
    [PSCustomObject]@{Nom="Hocine"; Prenom="Sara"; Login="shocine"; OU="Promo2025"}
)

# 🔹 Étape 2 : Créer un groupe Etudiants2025 et y ajouter les utilisateurs
$Groups = @{}
$Groups["Etudiants2025"] = $Promo2025

# 🔹 Étape 3 : Afficher les membres du groupe
Write-Host "=== Groupe Etudiants2025 ==="
foreach ($user in $Groups["Etudiants2025"]) {
    Write-Host "$($user.Prenom) $($user.Nom) - Login: $($user.Login) - OU: $($user.OU)"
}

# 🔹 Étape 4 : Exporter la liste finale dans un fichier CSV
$ExportPath = "C:\Temp\Etudiants2025.csv"
$Groups["Etudiants2025"] | Export-Csv -Path $ExportPath -NoTypeInformation -Encoding UTF8

Write-Host "`n Liste finale exportée vers : $ExportPath"

