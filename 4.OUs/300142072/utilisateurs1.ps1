<<<<<<< HEAD:4.OUs/300148450/utilisateurs1.ps1
Write-Host "Création des utilisateurs..." -ForegroundColor Cyan

New-ADUser `
  -Name "Alice Dupont" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice.dupont" `
  -UserPrincipalName "alice.dupont@DC300148450-00.local" `
  -Path "CN=Users,DC=DC300148450-00,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Motdepasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Credential $cred

New-ADUser `
  -Name "Marc Petit" `
  -GivenName "Marc" `
  -Surname "Petit" `
  -SamAccountName "marc.petit" `
  -UserPrincipalName "marc.petit@DC300148450-00.local" `
  -Path "CN=Users,DC=DC300148450-00,DC=local" `
  -AccountPassword (ConvertTo-SecureString "Motdepasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Credential $cred

=======
. .\bootstrap.ps1
Import-Module ActiveDirectory

Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName
>>>>>>> 527495765984952f9723a6557b47a9b359ab761b:4.OUs/300142072/utilisateurs1.ps1
