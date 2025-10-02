# Script 2 - Filtrage des utilisateurs
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Paul"; Login="pmartin"; OU="Formateurs"}
)

Write-Host "=== FILTRAGE ==="
Write-Host "Noms commençant par B:"
$Users | Where-Object {$_.Nom -like "B*"} | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom)" 
}

Write-Host "`nTous les stagiaires:"
$Users | Where-Object {$_.OU -eq "Stagiaires"} | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom)" 
}
