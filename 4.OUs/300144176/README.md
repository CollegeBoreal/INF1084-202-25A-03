$studentNumber = 300144176
$studentInstance = "01"
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

````````````
Import-Module ActiveDirectory

# Vérifier le domaine et le contrôleur
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

````````````
Get-ADUser -Filter * | Select-Object Name, SamAccountName


  New-ADUser `
  -Name "Alice" `
  -GivenName "Alice" `
  -Surname "Dupont" `
  -SamAccountName "alice" `
  -UserPrincipalName "alice@$domainName" `
  -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
  -Enabled $true `
  -Path "CN=Users,DC=$netbiosName,DC=local" `
  -Credential $cred

Set-ADUser -Identity "alice" `
  -EmailAddress "alice@exemple.com" `
  -GivenName "Alice-Marie" `
  -Credential $cred

Disable-ADAccount -Identity "alice" -Credential $cred

Enable-ADAccount -Identity "alice" -Credential $cred

Remove-ADUser -Identity "alice" -Confirm:$false -Credential $cred

Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName


Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

Move-ADObject -Identity "CN=Alice,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

              Get-ADUser -Identity "alice" | Select-Object Name, DistinguishedName




