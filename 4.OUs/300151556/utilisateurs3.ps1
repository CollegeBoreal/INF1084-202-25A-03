New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300151556-00.local" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
  -Enabled $true `
  -Path "OU=Etudiants,OU=300151556,DC=DC300151556-00,DC=local"
