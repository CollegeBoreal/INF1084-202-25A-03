
. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Lister tous les utilisateurs dont le nom commence par "B"
write-host "`nliste  les utilisateurs dont le nom commence par B`n"
$Users | Where-Object {$_.Nom -like "B*"}

# Lister tous les utilisateurs dans l'OU "Stagiaires"
write-host "`nliste  les utilisateurs dans l'OU est stagiaire`n"
$Users | Where-Object {$_.OU -eq "Stagiaires"}
# Lister tous les utilisateurs dans le prenom contient a "majuscule ou miniscule: incensible a la casse"
write-host "`nliste  les utilisateurs dont le prenom contient a majuscule ou miniscule`n"
$Users | Where-Object {$_.Prenom -like "*a*"}
