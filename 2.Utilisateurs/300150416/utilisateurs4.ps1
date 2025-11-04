# Fichier : utilisateurs4.ps1
# Partie 4 : Export CSV + Import CSV + ImportGroupe (dans le dossier courant)

# Bloc USERS autonome
$Users = @(
    [pscustomobject]@{Prenom="Alice";     Nom="Dupont";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Prenom="Sarah";     Nom="Lemoine";   Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Prenom="Karim";     Nom="Benali";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Prenom="messi";     Nom="lionel";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Prenom="ronaldo";   Nom="cristiano"; Login="cr7";      OU="Stagiaires"}
)

# Dossier courant (pas de PSScriptRoot pour eviter les chemins)
$Here = (Get-Location).Path

# Export CSV
$csvPath = Join-Path $Here "UsersSimules.csv"
$Users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Import CSV
$ImportedUsers = Import-Csv -Path $csvPath

# Creer ImportGroupe et y ajouter tous les importes
$Groups = @{ "ImportGroupe" = @() }
$Groups["ImportGroupe"] += $ImportedUsers

# Controle
"CSV importe depuis: $csvPath"
"Total dans ImportGroupe: $($Groups['ImportGroupe'].Count)"
$Groups["ImportGroupe"] | Select-Object Prenom, Nom, Login, OU
