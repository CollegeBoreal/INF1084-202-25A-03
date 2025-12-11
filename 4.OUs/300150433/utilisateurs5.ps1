Import-Module ActiveDirectory

$domainName = "dc300150433-00.local"

# Désactiver Alice
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Activer Alice
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer Alice
Remove-ADUser -Identity "alice.dupont" -Server $domainName -Confirm:$false

# Rechercher les utilisateurs commençant par 'a'
Get-ADUser -Filter "Name -like 'a*'" -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName

# Lister tous les utilisateurs
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName
