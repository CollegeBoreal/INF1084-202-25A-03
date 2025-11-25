New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "adupont" `
           -UserPrincipalName "adupont@DC300147816-0.local" `
           -Path "OU=Utilisateurs,DC=DC300147816-0,DC=local" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
          

