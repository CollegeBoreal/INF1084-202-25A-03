# utilisateurs2.ps1

# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

# Ajouter tous les utilisateurs de l'OU "Stagiaires" dans "GroupeFormation"
$Groups["GroupeFormation"] += $Users | Where-Object {$_.OU -eq "Stagiaires"}

# Afficher le groupe
$Groups["GroupeFormation"] | ForEach-Object { "$($_.Prenom) $($_.Nom)" }

