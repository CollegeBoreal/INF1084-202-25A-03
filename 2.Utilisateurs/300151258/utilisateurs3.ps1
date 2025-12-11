
. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Lister tous les utilisateurs dont le nom commence par "B"
write-host "`nliste  les utilisateurs dont le nom commence par B`n"
$Users | Where-Object {$_.Nom -like "B*"}|Format-Table

# Lister tous les utilisateurs dans l'OU "Stagiaires"
write-host "`nliste  les utilisateurs dans l'OU est stagiaires`n"
$Users | Where-Object {$_.OU -eq "Stagiaires"}|Format-Table
# Lister tous les utilisateurs dans le nom contient a "majuscule ou miniscule"
write-host "`nliste  les utilisateurs dont le prenom contient a majuscule ou miniscule`n"
$Users | Where-Object {$_.Prenom -like "*a*"}|Format-Table
