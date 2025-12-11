# 300146418

* J'ai renommer le nom de la machine

```powershell
Rename-Computer -NewName "DC300146418" -Restart
```

* J'installe Active Directory

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```
<details>
    <summary>Output</summary>
    
```powershell
Success Restart Needed Exit Code      Feature Result
------- -------------- ---------      --------------
True    No             Success        {Active Directory Domain Services, Group P...
```
</details>

* J'ajoute une nouvelle foret a mon AD

```powershell
Install-ADDSForest `
    -DomainName "DC300146418-00.local" `
    -DomainNetbiosName "DC300146418-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Ikram123" -AsPlainText -Force) `
    -Force
```

* je me connect a mon domaine avec le nom d'utilisateur ci dessous et le mot de passe de la VM

DC300146418-00\Administrator

<img src="images/111.png" alt="Images" width="450"/>

Vous verez les services installer ainsi que le DNS comme sur l'image

* Je verifie que mon controlleur de donnaime est bien installer
  
```powershell
Get-ADDomain
```
<details>
    <summary>Output</summary>
    
```powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300146418-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300146418-00,DC=local
DistinguishedName                  : DC=DC300146418-00,DC=local
DNSRoot                            : DC300146418-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300146418-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300146418-00,DC=local
Forest                             : DC300146418-00.local
InfrastructureMaster               : DC300146418.DC300146418-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300146418-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300146418-00,DC=local
ManagedBy                          :
Name                               : DC300146418-00
NetBIOSName                        : DC300146418-00
ObjectClass                        : domainDNS
ObjectGUID                         : 462da5dc-4e4f-4ec6-953c-734deb8c90f8
ParentDomain                       :
PDCEmulator                        : DC300146418.DC300146418-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300146418-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300146418.DC300146418-00.local}
RIDMaster                          : DC300146418.DC300146418-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300146418-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300146418-00,DC=local,
                                     CN=Configuration,DC=DC300146418-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300146418-00,DC=local
UsersContainer                     : CN=Users,DC=DC300146418-00,DC=local
```
</details>

```powershell
Get-ADForest
```
<details>
    <summary>Output</summary>
    
```powershell
ApplicationPartitions : {DC=ForestDnsZones,DC=DC300146418-00,DC=local, DC=DomainDnsZones,DC=DC300146418-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300146418.DC300146418-00.local
Domains               : {DC300146418-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300146418.DC300146418-00.local}
Name                  : DC300146418-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300146418-00,DC=local
RootDomain            : DC300146418-00.local
SchemaMaster          : DC300146418.DC300146418-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
```
</details>

<img src="images/2222.png" alt="Images" width="450"/>
<img src="images/3333.png" alt="Images" width="450"/>
