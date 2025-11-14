# Charger les utilisateurs du premier script
$Users = .\utilisateurs1.ps1

# Créer les groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

# Ajouter tous les utilisateurs où OU = "Stagiaires" dans GroupeFormation
$Groups["GroupeFormation"] = $Users | Where-Object { $_.OU -eq "Stagiaires" }

# Vérification
Write-Host "`n=== Membres de GroupeFormation ===" -ForegroundColor Yellow
$Groups["GroupeFormation"] | ForEach-Object {
    "  - $($_.Prenom) $($_.Nom)"
}

Write-Host "`n=== Nombre total dans GroupeFormation: $($Groups["GroupeFormation"].Count) ===" -ForegroundColor Cyan
# Retourner les groupes
return $Groups
