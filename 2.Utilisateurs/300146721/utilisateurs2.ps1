# Charger le fichier contenant les utilisateurs
. "$PSScriptRoot\utilisateurs1.ps1"

# Création des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter les stagiaires dans le groupe 'GroupeFormation'
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Vérification du contenu du groupe
Write-Output "=== Membres du GroupeFormation ==="
$Groups["GroupeFormation"] | ForEach-Object {
    Write-Output ("{0} {1}" -f $_.Prenom, $_.Nom)
}

