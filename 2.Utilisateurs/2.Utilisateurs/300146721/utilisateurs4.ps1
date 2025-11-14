# --- 0) Emplacement cohérent, sans hardcoder "sigad" ---
$Base    = "C:\Users\$env:USERNAME\Developer\INF1084-202-25A-03\2.Utilisateurs\300146721"
$CsvPath = Join-Path $Base 'file_users1.csv'
New-Item -ItemType Directory -Path $Base -Force | Out-Null

# --- 1) Construire $Users ---
$Users = @(
    [pscustomobject]@{ Prenom="Alice"; Nom="Dupont";  Login="adupont";  OU="Stagiaires" }
    [pscustomobject]@{ Prenom="Sarah"; Nom="Lemoine"; Login="slemoine"; OU="Stagiaires" }
    [pscustomobject]@{ Prenom="Karim"; Nom="Benali";  Login="kbenali";  OU="Stagiaires" }
)

# --- 2) Export ---
$Users | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8
Write-Host "`nExport OK -> $CsvPath`n"

# --- 3) Import ---
$UsersImportes = Import-Csv -Path $CsvPath -Encoding UTF8
if (-not $UsersImportes) { Write-Host "Aucun utilisateur trouvé dans le CSV."; return }

# --- 4) Groupe et affichage ---
$ImportGroupe = @()
$ImportGroupe += $UsersImportes

Write-Host "Membres du groupe ImportGroupe`n"
$ImportGroupe | Select-Object Prenom, Nom, Login, OU | Format-Table -AutoSize

