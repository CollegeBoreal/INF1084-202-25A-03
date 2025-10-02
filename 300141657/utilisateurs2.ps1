# Définir une liste d'utilisateurs
$Users = @("Alice Dupont", "Bob Martin", "Claire Leroy")

# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter un utilisateur à un groupe
$Groups["GroupeFormation"] += $Users[0]   # Ajoute Alice Dupont
$Groups["ProfesseursAD"]   += $Users[1]   # Ajoute Bob Martin

# Afficher les groupes et leurs membres
foreach ($group in $Groups.Keys) {
    Write-Host "`n$group :"
    $Groups[$group] | ForEach-Object { Write-Host " - $_" }
}

