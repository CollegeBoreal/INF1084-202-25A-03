New-ADUser `
  -Name "Justin Sandy" `
  -GivenName "Justin" `
  -Surname "Sandy" `
  -SamAccountName "justin.sandy" `
  -UserPrincipalName "justin.sandy@DC-300151403-00.local" `
  -Path "CN=Users,DC=DC-300151403-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrer le mot de passe pour Justin Sandy" -AsSecureString) `
  -Enabled $true `
  -Credential $cred
