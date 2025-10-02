# Charger les 5 étudiants
. .\etudiant1.ps1
. .\etudiant2.ps1
. .\etudiant3.ps1
. .\etudiant4.ps1
. .\etudiant5.ps1

# Charger le groupe
. .\groupesPromo.ps1

# Mettre tous les étudiants dans une liste
$Etudiants = @($Etudiant1, $Etudiant2, $Etudiant3, $Etudiant4, $Etudiant5)

# Ajouter les étudiants dans le groupe Etudiants2025
foreach ($etu in $Etudiants) {
    if ($etu.OU -eq "Promo2025") {
        $GroupesPromo["Etudiants2025"] += $etu
    }
}

# Vérification
Write-Host "=== Etudiants du groupe Etudiants2025 ==="
$GroupesPromo["Etudiants2025"] | Format-Table -AutoSize

# Exporter en CSV
$GroupesPromo["Etudiants2025"] | Export-Csv -Path "Etudiants2025.csv" -NoTypeInformation
Write-Host "`nLe fichier Etudiants2025.csv a été créé."
