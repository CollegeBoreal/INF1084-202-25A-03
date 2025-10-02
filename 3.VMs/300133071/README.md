# 300133071

* J'ai renommer le nom de la machine

```powershell
Rename-Computer -NewName "DC300133071" -Restart
```

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```


```powershell
Install-ADDSForest `
    -DomainName "DC300133071_1.local" `
    -DomainNetbiosName "DC300133071_1" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Cameroon2024&" -AsPlainText -Force) `
    -Force
```
