New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300144176-01.local" `
  -Path "CN=Users,DC=DC300144176-01,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true `
  -Credential $cred
