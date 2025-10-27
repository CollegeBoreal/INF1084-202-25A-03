<#
 Fichier : utilisateurs1.ps1
 Partie 1 : Création d'utilisateurs + affichage
 Étudiant : 300150416
#>

# Liste d'utilisateurs simulés (PSCustomObject)
$Users = @(
    [pscustomobject]@{Nom="Dupont";     Prenom="Alice";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine";    Prenom="Sarah";    Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";     Prenom="Karim";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lionel";     Prenom="Messi";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Nom="Cristiano";  Prenom="Ronaldo";  Login="cr7";      OU="Stagiaires"}
)

# Affichage demandé
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}

# Liste d'utilisateurs simulés (PSCustomObject)
$Users = @(
    [pscustomobject]@{Nom="Dupont";     Prenom="Alice";    Login="adupont";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lemoine";    Prenom="Sarah";    Login="slemoine"; OU="Stagiaires"},
    [pscustomobject]@{Nom="Benali";     Prenom="Karim";    Login="kbenali";  OU="Stagiaires"},
    [pscustomobject]@{Nom="Lionel";     Prenom="Messi";    Login="lm10";     OU="Stagiaires"},
    [pscustomobject]@{Nom="Cristiano";  Prenom="Ronaldo";  Login="cr7";      OU="Stagiaires"}
)


# Normaliser en PSCustomObject
function Normalize-Users($list) {
    $list | ForEach-Object {
        if ($_ -is [pscustomobject]) { $_ }
        else { [pscustomobject]@{ Nom = $_['Nom']; Prenom = $_['Prenom']; Login = $_['Login']; OU = $_['OU'] } }
    }
}
$Users = Normalize-Users $Users

# Dossier du script (ou dossier courant si lancé en interactif)
$Here = $PSScriptRoot
if ([string]::IsNullOrEmpty($Here)) { $Here = (Get-Location).Path }

# Export CSV dans le même dossier
$csvPath = Join-Path $Here "UsersSimules.csv"
$Users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Import CSV
$ImportedUsers = Import-Csv -Path $csvPath

# Créer ImportGroupe et y ajouter tous les utilisateurs importés
$Groups = @{ "ImportGroupe" = @() }
$Groups["ImportGroupe"] += $ImportedUsers

# Contrôle
"CSV importé depuis: $csvPath"
"Total dans ImportGroupe: $($Groups["ImportGroupe"].Count)"
$Groups["ImportGroupe"] | Select-Object Prenom,Nom,Login,OU
