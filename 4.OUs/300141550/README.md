 Création d'un fichier bootstrap.ps1

``PowerShell``
 # vos informations
>> $studentNumber = 300141550
>> $studentInstance = 00
>>
>> # les noms respectifs
>> $domainName = "DC$300141550-$0.local"
>> $netbiosName = "DC$300141550-$0"
>>
>> # les informations de sécurité
>> $plain = 'Infra@2024'
>> $secure = ConvertTo-SecureString $plain -AsPlainText -Force
>> $cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName",$secure)
>>
>> 

operations néscessitant les informations sécurisées de l'administrateur
$cred = Get-Credential 

1️⃣ Préparer l’environnement
Import-Module ActiveDirectory
Get-ADDomain -Server "DC300141550.local"
Get-ADDomainController -Filter * -Server "DC300141550.local"

2️⃣ Liste des utilisateurs du domaine
Get-ADUser -Filter * -Server "DC300141550.local" -Properties Name, SamAccountName, Enabled |
 Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

3️⃣ Créer un nouvel utilisateur
New-ADUser -Name "Alice Dupont" `
-GivenName "Alice" `
-Surname "Dupont" `
-SamAccountName "alice.dupont" `
-UserPrincipalName "alice.dupont@DC300141550-1.local" `
-AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
-Enabled $true `
-Path "CN=Users,DC=DC300141550,DC=local"

4️⃣ Modifier un utilisateur
.\utilisateurs4.ps1

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
