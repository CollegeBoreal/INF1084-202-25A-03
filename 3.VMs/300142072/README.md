:accessibility: Installation et configuration d'un controlleur de domine    Active Directory sur Windows Server 2022

🔢 Renommer le serveur 
``` sh
Rename-Computer -NewName "DC300142072-50" -Restart
```
🔢 Installer le role AD DS

``` sh
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

🔢 Creer un nouveau domaine (nouvelle foret)

``` sh
Install-ADDSForet `
   -DomainName "DC300142072-50.local" `
   -DomainNetbiosName "DC300142072-50" `
   -InstallDns:$true `
   -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
   -Force `
```

🔢 Verification de l'installation

``` sh
    DC300142072-50/Administrator
```

puis avec :

```sh
Get-ADDomain
Get-ADForest
```



