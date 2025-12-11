# utilisateurs3.ps1
Import-Module ActiveDirectory

# Informations de connexion
$domainName = "DC300141657-00.local"
$netbiosName = "DC300141657-00"
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Désactiver l'utilisateur
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

# Vérifier qu'il est désactivé
Get-ADUser -Identity "alice.dupont" | Select-Object Name, Enabled

# Réactiver l'utilisateur
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

# Vérifier qu'il est activé
Get-ADUser -Identity "alice.dupont" | Select-Object Name, Enabled

# Supprimer l'utilisateur
Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred