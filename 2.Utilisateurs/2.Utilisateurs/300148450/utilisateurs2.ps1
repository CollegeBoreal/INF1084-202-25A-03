
# Charger les utilisateurs depuis utilisateur1.ps1
. "$PSScriptRoot\utilisateurs1.ps1"

# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter tous les utilisateurs dont lOU = "Stagiaires" dans GroupeFormation (Exercice 2)
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Vérifier
Write-Host "=== Membres du GroupeFormation ===" -ForegroundColor Green
$Groups["GroupeFormation"] | ForEach-Object { "$($_.Prenom) $($_.Nom)" }

