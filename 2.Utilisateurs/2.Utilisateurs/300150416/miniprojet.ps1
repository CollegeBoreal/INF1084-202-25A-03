# Fichier : mini-projet.ps1
# Partie 5 : Promo2025 -> Groupe Etudiants2025 -> Export CSV (dossier courant)

# 1) 5 utilisateurs dans OU "Promo2025"
$Promo2025 = @(
    [pscustomobject]@{Prenom="Leila"; Nom="Moreau";  Login="lmoreau"; OU="Promo2025"},
    [pscustomobject]@{Prenom="Enzo";  Nom="Rossi";   Login="erossi";  OU="Promo2025"},
    [pscustomobject]@{Prenom="Tuan";  Nom="Nguyen";  Login="tnguyen"; OU="Promo2025"},
    [pscustomobject]@{Prenom="Maya";  Nom="Haddad";  Login="mhaddad"; OU="Promo2025"},
    [pscustomobject]@{Prenom="Sofia"; Nom="Garcia";  Login="sgarcia"; OU="Promo2025"}
)

# 2) Groupe "Etudiants2025"
$Groups = @{ "Etudiants2025" = @() }

# 3) Ajouter tous les membres "Promo2025"
$Groups["Etudiants2025"] += $Promo2025

# 4) Export CSV dans le dossier courant
$Here = (Get-Location).Path
$out = Join-Path $Here "Etudiants2025.csv"

$Groups["Etudiants2025"] | Export-Csv -Path $out -NoTypeInformation -Encoding UTF8

"Export effectue: $out"
$Groups["Etudiants2025"] | Select-Object Prenom, Nom, Login, OU
