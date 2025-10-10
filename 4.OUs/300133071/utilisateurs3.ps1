New-ADUser `
  -Name "Siga Diarra" `
  -GivenName "Diarra" `
  -Surname "Siga" `
  -SamAccountName "siga" `
  -UserPrincipalName "siga@DC300133071-00.local" `
  -Path "CN=Users,DC=DC300133071-00,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true `
  -Credential $cred
