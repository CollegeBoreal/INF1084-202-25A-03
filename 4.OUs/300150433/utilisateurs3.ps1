$domainName = "DC300150433-00.local"

New-ADUser -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
<<<<<<< HEAD
  -UserPrincipalName "alice.dupont@dc300150433-00.local" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=dc300150433-00,DC=local"
=======
  -UserPrincipalName "alice.dupont@$domainName" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=DC300150433-00,DC=local"
>>>>>>> e531e11938a31f19675ed2afb245165b0b97d956
