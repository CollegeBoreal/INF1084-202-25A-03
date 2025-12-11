# utilisateurs2.ps1
Import-Module ActiveDirectory

# Informations de connexion
$domainName = "DC300141625-00.local"
$netbiosName = "DC300141625-00"
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Créer un nouvel utilisateur "Alice Dupont"
New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

# Modifier cet utilisateur
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

# Vérifier la création et la modification
Get-ADUser -Identity "alice.dupont" | Select-Object Name, SamAccountName, EmailAddress, Enabled
