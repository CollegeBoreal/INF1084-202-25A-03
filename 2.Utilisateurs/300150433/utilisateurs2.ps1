# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

# Ajouter un utilisateur à un groupe (exemple)
$Groups["GroupeFormation"] += $Users[0]   # Alice Dupont

# Exercice 2 : Ajouter tous les utilisateurs dont l’OU = "Stagiaires" dans "GroupeFormation"
foreach ($user in $Users) {
    if ($user.OU -eq "Stagiaires") {
        $Groups["GroupeFormation"] += $user
    }
}

# Afficher le contenu des groupes
foreach ($group in $Groups.GetEnumerator()) {
    Write-Host "`nGroupe : $($group.Key)"
    foreach ($member in $group.Value) {
        Write-Host " - $($member.Prenom) $($member.Nom) - Login: $($member.Login)"
    }
}
