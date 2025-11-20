# Désactiver l'utilisateur
Disable-ADAccount -Identity "alice.dupont" -Server $domainName

# Réactiver l'utilisateur
Enable-ADAccount -Identity "alice.dupont" -Server $domainName

# Supprimer l'utilisateur
Remove-ADUser -Identity "alice.dupont" -Server $domainName -Confirm:$false

# Rechercher les utilisateurs dont le nom commence par 'a'
Get-ADUser -Filter "Name -like 'a*'" -Server $domainName -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

# Exporter tous les utilisateurs dans un fichier CSV
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
