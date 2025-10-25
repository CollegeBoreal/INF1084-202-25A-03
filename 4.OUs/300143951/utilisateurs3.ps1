$domainName = "inf1084.local"
$netbiosName = "inf1084"
$cred = Get-Credential

New-ADUser -Name "Alice Dupont" `
    -GivenName "Alice" `
    -Surname "Dupont" `
    -SamAccountName "alice.dupont" `
    -UserPrincipalName "alice.dupont@$domainName" `
    -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
    -Enabled $true `
    -Path "CN=Users,DC=$netbiosName,DC=local" `
    -Credential $cred

