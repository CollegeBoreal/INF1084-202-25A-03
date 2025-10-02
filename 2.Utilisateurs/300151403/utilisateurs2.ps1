# Créer des utilisateurs comme objets PowerShell
$Users = @(
    [PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Age=28},
    [PSCustomObject]@{Nom="Martin"; Prenom="Claire"; Age=32},
    [PSCustomObject]@{Nom="Diallo"; Prenom="Ibrahima"; Age=40}
)

# Créer la table des groupes
$Groups = @{}

# Fonction pour ajouter un utilisateur à un groupe
function Add-ToGroup {
    param (
        [string]$GroupName,
        [object]$User
    )

    # Si le groupe n’existe pas, on le crée
    if (-not $Groups.ContainsKey($GroupName)) {
        $Groups[$GroupName] = @()
    }

    # Ajouter l’utilisateur au groupe
    $Groups[$GroupName] += $User
}

# Utilisation de la fonction
Add-ToGroup -GroupName "GroupeFormation" -User $Users[0]  # Alice Dupont
Add-ToGroup -GroupName "ProfesseursAD"   -User $Users[1]  # Claire Martin
Add-ToGroup -GroupName "ProfesseursAD"   -User $Users[2]  # Ibrahima Diallo

# Affichage des groupes
Write-Host "`n--- Groupes ---"
foreach ($Group in $Groups.Keys) {
    Write-Host "`n$Group :"
    $Groups[$Group] | Format-Table Nom, Prenom, Age
}

