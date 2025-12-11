# utilisateur1.ps1
$studentNumber = 300141625
$studentInstance = 0

$domainName = "DC300141625-00.local"
$netbiosName = "DC300141625-00"

$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

Import-Module ActiveDirectory

# Lister tous les utilisateurs actifs sauf comptes système
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName



