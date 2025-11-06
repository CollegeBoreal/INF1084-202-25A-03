:accessibility: Installation et configuration d'un controlleur de domine    Active Directory sur Windows Serve 2022

🔢 Renommer le serveur 
``` sh
Rename-Computer -NewName "DC300142072" -Restart
```
🔢 Installer le role AD DS

``` sh
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

🔢 Creer un nouveau domaine (nouvelle foret)

``` sh
Install-ADDSForet `
   -DomainNmae "DC300142072-00.local" `
   -DomaineNetbiosName "DC300142072-00" `
   -InstallDns:$true `
   -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
   -Force `
```

🔢 Verification de l'installation

``` sh
    DC300142072/Administrator
```

puis avec :

```sh
Get-ADDomain
Get-ADForest
```



