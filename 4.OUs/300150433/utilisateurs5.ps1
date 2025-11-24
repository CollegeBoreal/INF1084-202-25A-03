# Définir le nom du domaine Active Directory
$domainName = "dc300150433-00.local"

# Désactiver un utilisateur
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Activer un utilisateur
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer un utilisateur
Remove-ADUser -Identity "alice.dupont" -Server $domainName -Confirm:$false

# Rechercher les utilisateurs dont le nom commence par 'a'
Get-ADUser -Filter "Name -like 'a*'" -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName

# Lister tous les utilisateurs
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName
