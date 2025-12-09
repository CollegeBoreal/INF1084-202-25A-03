# Désactiver l'utilisateur
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

# Vérifier que l'utilisateur est désactivé
Get-ADUser -Identity "alice.dupont" -Properties Enabled | Select-Object Name, SamAccountName, Enabled
