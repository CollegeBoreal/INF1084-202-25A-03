# Jeux de données
$Users = @(
    [pscustomobject]@{Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Martin";  Prenom="Nora";   Login="nmartin";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Boucher"; Prenom="Adam";   Login="aboucher"; OU="Formation"}
)

# S'assurer que le dossier existe
$dest = "C:\Temp"
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest | Out-Null }

# Export CSV
$csvPath = Join-Path $dest "UsersSimules.csv"
$Users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Import CSV
$ImportedUsers = Import-Csv -Path $csvPath

# Exercice 4 : créer ImportGroupe et y ajouter tous les utilisateurs importés
$Groups = @{ "ImportGroupe" = @() }
$Groups["ImportGroupe"] += $ImportedUsers

# Contrôle
"CSV importé depuis: $csvPath"
"Total dans ImportGroupe: " + ($Groups["ImportGroupe"].Count)
$Groups["ImportGroupe"] | Select-Object Prenom,Nom,Login,OU
