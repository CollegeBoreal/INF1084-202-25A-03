# 300150562

## Configuration du Serveur

### 1. Renommage de la machine
```powershell
Rename-Computer -NewName "DC300150562" -Restart
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
<details> <summary>Output</summary>
Success Restart Needed Exit Code      Feature Result
------- -------------- ---------      --------------
True    No             Success        {Active Directory Domain Services, Group Policy Management, ...}
</details> 
Install-ADDSForest `
    -DomainName "DC300150562-00.local" `
    -DomainNetbiosName "DC300150562-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
