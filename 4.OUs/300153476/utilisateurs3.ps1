
New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300153476-00.local" `
  -Path "CN=Users,DC=DC300153476-00,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true `
  -Credential $cred

