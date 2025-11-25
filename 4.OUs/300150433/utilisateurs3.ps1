New-ADUser -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@dc300150433-00.local" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=dc300150433-00,DC=local"
