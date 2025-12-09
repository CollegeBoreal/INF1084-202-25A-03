<<<<<<< HEAD
# Définir le nom du domaine Active Directory
$domainName = "dc300151258-00.local"

# Désactiver un utilisateur
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Activer un utilisateur
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer un utilisateur
=======
$domainName = "dc300151258-00.local"

# Désactiver Alice
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Activer Alice
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer Alice
>>>>>>> e531e11938a31f19675ed2afb245165b0b97d956
Remove-ADUser -Identity "alice.dupont" -Server $domainName -Confirm:$false

# Rechercher les utilisateurs commençant par 'a'
Get-ADUser -Filter "Name -like 'a*'" -Server $domainName -Properties Name, SamAccountName |
    Select-Object Name, SamAccountName

# Lister tous les utilisateurs
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName |
<<<<<<< HEAD
    Select-Object Name, SamAccountName
 
=======
Select-Object Name, SamAccountName
>>>>>>> e531e11938a31f19675ed2afb245165b0b97d956
