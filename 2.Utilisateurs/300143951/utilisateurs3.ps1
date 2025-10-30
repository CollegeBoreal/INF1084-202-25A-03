# Charger les utilisateurs
$Users = .\utilisateurs1.ps1

Write-Host "`n=== REQUeTES ET FILTRES ===" -ForegroundColor Magenta

# Lister tous les utilisateurs dont le nom commence par "B"
Write-Host "`n1. Utilisateurs dont le nom commence par 'B':" -ForegroundColor Yellow
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object {
    "   $($_.Prenom) $($_.Nom)"
}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
Write-Host "`n2. Utilisateurs dans l'OU 'Stagiaires':" -ForegroundColor Yellow
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object {
    "   $($_.Prenom) $($_.Nom)"
}

# Lister tous les utilisateurs dont le prénom contient "a" (insensible à la casse)
Write-Host "`n3. Utilisateurs dont le prénom contient 'a' (maj/min):" -ForegroundColor Yellow
$Users | Where-Object {$_.Prenom -match "a"} | ForEach-Object {
    "   $($_.Prenom) $($_.Nom)"
}
