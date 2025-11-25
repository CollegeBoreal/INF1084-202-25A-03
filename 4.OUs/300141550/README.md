- [ ]  Création d'un fichier bootstrap.ps1

``` sh
nano bootstrap.ps1
```

```powershell
 # vos informations
$studentNumber = 300141550
$studentInstance = 00
# les noms respectifs
$domainName = "DC$300141550-$0.local"
$netbiosName = "DC$300141550-$0"
# les informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName",$secure)

```
<img width="421" height="153" alt="image" src="https://github.com/user-attachments/assets/b4ac65a0-16f3-4026-84fd-4caa6706dcaf" />


- [ ] operations néscessitant les informations sécurisées de l'administrateur
```powershell       
$cred = Get-Credential 
```

- [ ] 1️⃣ Préparer l’environnement
 ``` sh
nano utilisateurs1.ps1
```
```powershell  
Import-Module ActiveDirectory
Get-ADDomain -Server "DC300141550.local"
Get-ADDomainController -Filter * -Server "DC300141550.local"
```
<img width="846" height="497" alt="image" src="https://github.com/user-attachments/assets/f5393952-2bae-4124-a214-86794c3ce175" />


- [ ] 2️⃣ Liste des utilisateurs du domaine

 ``` sh
nano utilisateurs2.ps1
```
```powershell
Get-ADUser -Filter * -Server "DC300141550.local" -Properties Name, SamAccountName, Enabled |
 Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```
<img width="625" height="92" alt="image" src="https://github.com/user-attachments/assets/46ae0dc4-582f-4001-9014-c1754f61320e" /> 


- [ ] 3️⃣ Créer un nouvel utilisateur
 ``` sh
nano utilisateurs3.ps1
```
```pwershell
New-ADUser -Name "Alice Dupont" `
-GivenName "Alice" `
-Surname "Dupont" `
-SamAccountName "alice.dupont" `
-UserPrincipalName "alice.dupont@DC300141550-1.local" `
-AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
-Enabled $true `
-Path "CN=Users,DC=DC300141550,DC=local"
```
<img width="646" height="111" alt="image" src="https://github.com/user-attachments/assets/bd56c82e-e8d8-4676-8b9b-cc4f3065cf52" />

- [ ] 4️⃣ Modifier un utilisateur
``` sh
.\utilisateurs4.ps1
```
```pwershell
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
```
<img width="811" height="95" alt="image" src="https://github.com/user-attachments/assets/97521ed3-994f-4142-acc8-8e9fac4e971a" />



