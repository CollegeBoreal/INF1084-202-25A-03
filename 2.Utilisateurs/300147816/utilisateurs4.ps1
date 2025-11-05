
. "$PSScriptRoot\utilisateurs1.ps1" > $null
# 1. Importer le fichier CSV

$ImportedUsers = Import-Csv -Path "C:\Users\Amin\Developer\INF1084-202-25A-03\2.Utilisateurs\300147816\import.csv"

# 2. Créer un groupe "ImportGroupe" (dans Active Directory)
New-ADGroup -Name "ImportGroupe" -SamAccountName "ImportGroupe" -GroupScope Global -GroupCategory Security -Path "OU=Stagiaires,DC=mondomaine,DC=local"

# 3. Ajouter tous les utilisateurs importés dans ce groupe
foreach ($user in $ImportedUsers) {
    Add-ADGroupMember -Identity "ImportGroupe" -Members $user.SamAccountName
}

