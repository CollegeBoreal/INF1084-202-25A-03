New-ADUser `
  -Name "kadji" `
  -GivenName "Falcon" `
  -Surname "K falcon" `
  -SamAccountName "Kadji.falcon" `
  -UserPrincipalName "kadji.falcon@DC300143951-00.local" `
  -Path "CN=Users,DC=DC300143951-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrez le mot de passe pour K falcon" -AsSecureString) `
  -Enabled $true `
  -Credential $cred
