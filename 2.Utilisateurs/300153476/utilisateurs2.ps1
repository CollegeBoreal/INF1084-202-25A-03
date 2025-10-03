<<<<<<< HEAD
. "..\Utilisateur1.ps1"
=======
. .\utilisateurs1.ps1
>>>>>>> 4fa7d0cb00039d9b1e49a55a6d197df4eb9d424a
# Créer des groupes
$Groups = @{
    "GroupeFormation" = @();
    "ProfesseursAD" = @()
}

# Ajouter un utilisateur à un groupe
$Groups["GroupeFormation"] += $Users[0]   # Alice Dupont
# Ajouter tous les stagiaires
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object {
    $Groups["GroupeFormation"] += $_
}
# Afficher les membres du groupe
$Groups["GroupeFormation"] | ForEach-Object { "$($_.Prenom) $($_.Nom) - OU: $($_.OU)" }

