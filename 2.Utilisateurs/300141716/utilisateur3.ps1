# Charger les utilisateurs depuis utilisateur1.ps1
. "$PSScriptRoot\utilisateur1.ps1"

# Lister tous les utilisateurs dont le pr�nom contient "a" (majuscule/minuscule)
$Users | Where-Object { $_.Prenom -match "(?i)a" } | Format-Table Prenom, Nom, Login, OU

