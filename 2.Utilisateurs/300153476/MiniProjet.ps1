# -----------------------------
# Mini-projet : simulation utilisateurs et groupe
# -----------------------------

# 1. Créer 5 utilisateurs simulés dans l'OU "Promo2025"
$UsersPromo2025 = @(
    [PSCustomObject]@{Prenom="Rama";    Nom="Diallo";   Login="amartin";   OU="Promo2025"},
    [PSCustomObject]@{Prenom="Alpha";      Nom="Bah";  Login="bdurand";  OU="Promo2025"},
    [PSCustomObject]@{Prenom="Kadija";    Nom="Bah"; Login="clefevre"; OU="Promo2025"},
    [PSCustomObject]@{Prenom="Mahmud";    Nom="Bah";   Login="dpetit";   OU="Promo2025"},
    [PSCustomObject]@{Prenom="Abdoulaye";   Nom="Bah";  Login="emoreau";  OU="Promo2025"}
)

# Afficher les utilisateurs créés
Write-Host "Utilisateurs de Promo2025 :"
$UsersPromo2025 | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

# 2. Créer le groupe "Etudiants2025"
$Etudiants2025 = @()

# 3. Ajouter tous les utilisateurs de "Promo2025" dans le groupe
$Etudiants2025 += $UsersPromo2025

# 4. Afficher les membres du groupe
Write-Host "`nMembres du groupe Etudiants2025 :"
$Etudiants2025 | Format-Table Prenom, Nom, Login, OU -AutoSize

# 5. Exporter la liste finale du groupe en CSV
$CsvPath = "C:\Users\300153476\INF1084-202-25A-03\2.Utilisateurs\300153476\Etudiants2025.csv"
$Etudiants2025 | Export-Csv -Path $CsvPath -NoTypeInformation
Write-Host "`n✅ Liste exportée vers : $CsvPath"

