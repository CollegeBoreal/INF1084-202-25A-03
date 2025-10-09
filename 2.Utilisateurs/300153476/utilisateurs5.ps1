# 1️⃣ Créer 5 utilisateurs simulés dans l'OU "Promo2025"
$UsersPromo2025 = @(
    @{Nom="Martin";    Prenom="Emma";    Login="emartin";    OU="Promo2025"},
    @{Nom="Dubois";    Prenom="Lucas";   Login="ldubois";    OU="Promo2025"},
    @{Nom="Moreau";    Prenom="Chloé";   Login="cmoreau";    OU="Promo2025"},
    @{Nom="Lefebvre";  Prenom="Noah";    Login="nlefebvre";  OU="Promo2025"},
    @{Nom="Roux";      Prenom="Léa";     Login="lroux";      OU="Promo2025"}
)

# 2️⃣ Créer le groupe "Etudiants2025"
$Groups = @{
    "Etudiants2025" = @()
}

# 3️⃣ Ajouter tous les utilisateurs de "Promo2025" dans le groupe
$Groups["Etudiants2025"] += $UsersPromo2025

# 4️⃣ Afficher les membres du groupe
$Groups["Etudiants2025"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# 5️⃣ Exporter la liste finale du groupe en CSV
$Groups["Etudiants2025"] | Export-Csv -Path "C:\Temp\Etudiants2025.csv" -NoTypeInformation

