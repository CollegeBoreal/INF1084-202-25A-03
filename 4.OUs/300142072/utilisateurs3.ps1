Import-Module ActiveDirectory

$studentNumber = 300142072
$studentInstance = 20

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

New-ADUser -Name "Siga Diarra" `
           -GivenName "Siga" `
           -Surname "Diarra" `
           -SamAccountName "siga.diarra" `
           -UserPrincipalName "siga.diarra@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred
