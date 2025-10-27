# === BLOC USERS AUTONOME (sans chemin) ===
$Users = @(
    [pscustomobject]@{Nom="Dupont";     Prenom="Alice";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine";    Prenom="Sarah";    Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";     Prenom="Karim";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lionel";     Prenom="Messi";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Nom="Cristiano";  Prenom="Ronaldo";  Login="cr7";      OU="Stagiaires"}
)

# Affichage de contrôle
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Dossier du script (ou dossier courant si lancé en interactif)
$Here = $PSScriptRoot
if ([string]::IsNullOrEmpty($Here)) { $Here = (Get-Location).Path }

# Exporter les utilisateurs dans le même dossier
$csvPath = Join-Path $Here "UsersSimules.csv"
$Users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Importer le CSV
$ImportedUsers = Import-Csv -Path $csvPath

# Créer un groupe "ImportGroupe" et y ajouter tous les importés
$Groups = @{ "ImportGroupe" = @() }
$Groups["ImportGroupe"] += $ImportedUsers

# Contrôle
"CSV importé depuis: $csvPath"
"Total dans ImportGroupe: $($Groups["ImportGroupe"].Count)"
$Groups["ImportGroupe"] | Select-Object Prenom,Nom,Login,OU
