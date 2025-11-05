. .\utilisateur2.ps1
New-ADUser -Name "Ramatoulaye" `
           -GivenName "Diallo" `
           -Surname "Bah" `
           -SamAccountName "rama.diallo" `
           -UserPrincipalName "rama.diallo@$domainName" `
           -AccountPassword (ConvertTo-SecureString "Myabdoul@23" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred
