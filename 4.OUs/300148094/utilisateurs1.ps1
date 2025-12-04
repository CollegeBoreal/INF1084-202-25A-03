
Write-Host "Création des utilisateurs..." -ForegroundColor Cyan

New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300148094-00.local" `
  -Path "CN=Users,DC=DC300148094-00,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Motdepasse123!" -AsPlainText -Force) `
  -Enabled $true `
  

New-ADUser `
  -Name "Marc Petit" `
  -GivenName "Marc" `
  -Surname "Petit" `
  -SamAccountName "marc.petit" `
  -UserPrincipalName "marc.petit@DC300148094-00.local" `
  -Path "CN=Users,DC=DC300148094-00,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Motdepasse123!" -AsPlainText -Force) `
  -Enabled $true `
  
