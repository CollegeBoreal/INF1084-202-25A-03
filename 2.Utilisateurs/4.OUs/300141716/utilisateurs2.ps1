# Charger les utilisateurs depuis utilisateur1.ps1
. "$PSScriptRoot\utilisateurs1.ps1"

# Cr�er des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter tous les utilisateurs dont lOU = "Stagiaires" dans GroupeFormation (Exercice 2)
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# V�rifier
Write-Host "=== Membres du GroupeFormation ===" -ForegroundColor Green
$Groups["GroupeFormation"] | ForEach-Object { "$($_.Prenom) $($_.Nom)" }

