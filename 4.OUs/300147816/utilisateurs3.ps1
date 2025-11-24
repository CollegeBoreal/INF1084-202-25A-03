New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "adupont" `
           -UserPrincipalName "adupont@domaine.local" `
           -Path "OU=Utilisateurs,DC=domaine,DC=local" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
          

