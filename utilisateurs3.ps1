# ===== utilisateurs3.ps1 : Gestion d'un utilisateur =====

New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

Disable-ADAccount -Identity "alice.dupont" -Credential $cred

Enable-ADAccount -Identity "alice.dupont" -Credential $cred

# Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

