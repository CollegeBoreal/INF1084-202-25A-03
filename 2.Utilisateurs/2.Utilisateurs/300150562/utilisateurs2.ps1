# Créer une liste d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Paul"; Login="pmartin"; OU="Stagiaires"},
    @{Nom="Bernard"; Prenom="Sophie"; Login="sbernard"; OU="Stagiaires"}
)

# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

# Ajouter tous les utilisateurs dont l'OU = "Stagiaires" dans "GroupeFormation"
$Users | Where-Object { $_.OU -eq "Stagiaires" } | ForEach-Object {
    $Groups["GroupeFormation"] += $_
}

# Afficher les membres du groupe GroupeFormation
Write-Host "Membres du groupe GroupeFormation :" -ForegroundColor Green
$Groups["GroupeFormation"] | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom) (Login: $($_.Login))" 
}

# Afficher le contenu complet des groupes
Write-Host "`nContenu de tous les groupes :" -ForegroundColor Yellow
$Groups.GetEnumerator() | ForEach-Object {
    Write-Host "Groupe: $($_.Key)" -ForegroundColor Cyan
    if ($_.Value.Count -gt 0) {
        $_.Value | ForEach-Object { Write-Host "  - $($_.Prenom) $($_.Nom)" }
    } else {
        Write-Host "  (Aucun membre)"
    }
}