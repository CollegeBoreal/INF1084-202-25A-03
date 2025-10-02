# Définition des utilisateurs
$Users = @(
    [PSCustomObject]@{Nom="Alice Dupont";  OU="Stagiaires"}
    [PSCustomObject]@{Nom="Bob Martin";    OU="Professeurs"}
    [PSCustomObject]@{Nom="Benoit Leroy";  OU="Stagiaires"}
    [PSCustomObject]@{Nom="Claire Dubois"; OU="Stagiaires"}
)

# Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "`nUtilisateurs dont le nom commence par 'A' :" -ForegroundColor Cyan
$Users | Where-Object { $_.Nom -like "A*" } | Format-Table -AutoSize

# Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`nUtilisateurs dans l'OU 'Stagiaires' :" -ForegroundColor Cyan
$Users | Where-Object { $_.OU -eq "Stagiaires" } | Format-Table -AutoSize

