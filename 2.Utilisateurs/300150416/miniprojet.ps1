# 1) Créer 5 utilisateurs simulés dans l’OU "Promo2025"
$Promo2025 = @(
    [pscustomobject]@{Nom="Moreau";   Prenom="Leila";   Login="lmoreau";   OU="Promo2025"},
    [pscustomobject]@{Nom="Rossi";    Prenom="Enzo";    Login="erossi";    OU="Promo2025"},
    [pscustomobject]@{Nom="Nguyen";   Prenom="Tuan";    Login="tnguyen";   OU="Promo2025"},
    [pscustomobject]@{Nom="Haddad";   Prenom="Maya";    Login="mhaddad";   OU="Promo2025"},
    [pscustomobject]@{Nom="Garcia";   Prenom="Sofia";   Login="sgarcia";   OU="Promo2025"}
)

# 2) Créer un groupe "Etudiants2025"
$Groups = @{ "Etudiants2025" = @() }

# 3) Ajouter tous les utilisateurs de "Promo2025" dans le groupe
$Groups["Etudiants2025"] += $Promo2025

# 4) Exporter la liste finale du groupe en CSV
$dest = "C:\Temp"
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest | Out-Null }
$out = Join-Path $dest "Etudiants2025.csv"
$Groups["Etudiants2025"] | Export-Csv -Path $out -NoTypeInformation -Encoding UTF8

"Export effectué: $out"
$Groups["Etudiants2025"] | Select-Object Prenom,Nom,Login,OU
