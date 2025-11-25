New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "adupont" `
           -UserPrincipalName "adupont@DC300147816.local" `
           -Path "CN=Users,DC=DC300147816,DC=local" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
          


  

