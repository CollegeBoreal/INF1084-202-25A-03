# --- TP AD - Partie 4 : Export/Import CSV + Mini-projet ---
# Base d'utilisateurs
$Users = @(
  [pscustomobject]@{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Martin";  Prenom="Yves";   Login="ymartin";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benoit";  Prenom="Awa";    Login="abenoit";  OU="Stagiaires" }
)

# ----- Export / Import CSV (Exercice 4)
$csvPath = "C:\Temp\UsersSimules.csv"
$null = New-Item -ItemType Directory -Path (Split-Path $csvPath) -Force
$Users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8
"Exporté vers: $csvPath"

$ImportedUsers = Import-Csv -Path $csvPath
"--- Utilisateurs importés ---"
$ImportedUsers | ForEach-Object { "{0} {1} ({2})" -f $_.Prenom, $_.Nom, $_.Login }

$Groups = @{ "ImportGroupe" = @() }
$Groups["ImportGroupe"] += $ImportedUsers

"--- Membres de 'ImportGroupe' ---"
$Groups["ImportGroupe"] | ForEach-Object { "{0} {1}" -f $_.Prenom, $_.Nom }

# ----- Mini-projet (Partie 5)
$Promo2025 = @(
  [pscustomobject]@{ Nom="Traore";  Prenom="Moussa";  Login="mtraore";  OU="Promo2025" },
  [pscustomobject]@{ Nom="Nguyen";  Prenom="Linh";    Login="lnguyen";  OU="Promo2025" },
  [pscustomobject]@{ Nom="Diallo";  Prenom="Fatou";   Login="fdiallo";  OU="Promo2025" },
  [pscustomobject]@{ Nom="Roy";     Prenom="Chloe";   Login="croy";     OU="Promo2025" },
  [pscustomobject]@{ Nom="Santos";  Prenom="Diego";   Login="dsantos";  OU="Promo2025" }
)

$Groups["Etudiants2025"] = @()
$Groups["Etudiants2025"] += $Promo2025

$promoCsv = "C:\Temp\Etudiants2025.csv"
$Promo2025 | Export-Csv -Path $promoCsv -NoTypeInformation -Encoding UTF8

"--- Groupe 'Etudiants2025' ---"
$Groups["Etudiants2025"] | ForEach-Object { "{0} {1} ({2}) - {3}" -f $_.Prenom, $_.Nom, $_.Login, $_.OU }
"Exporté vers: $promoCsv"
