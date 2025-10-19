# 3️⃣ Créer un nouvel utilisateur

New-ADUser `
  -Name "Leandre Ebah" `
  -GivenName "Leandre" `
  -Surname "Ebah" `
  -SamAccountName "leandre.ebah" `
  -UserPrincipalName "leandre.ebah@DC300151825-00.local" `
  -Path "CN=Users,DC=DC300151825-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrer le mot de passe pour Leandre Ebah" -AsSecureString) `
  -Enabled $true `
  -Credential $cred
