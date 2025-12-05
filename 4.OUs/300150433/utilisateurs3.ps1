Import-Module ActiveDirectory

$domainName = "DC300150433-00.local"

New-ADUser -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@$domainName" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=DC300150433-00,DC=local"
