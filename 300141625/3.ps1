# Script 3 - Filtres avancés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Paul"; Login="pmartin"; OU="Formateurs"}
)

Write-Host "=== FILTRES AVANCÉS ==="
Write-Host "Prénoms contenant 'a':"
$Users | Where-Object {$_.Prenom -match "a"} | ForEach-Object { 
    Write-Host "- $($_.Prenom) $($_.Nom)" 
}
