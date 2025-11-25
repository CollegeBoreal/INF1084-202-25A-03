# 300141657

* J'ai renommer le nom de la machine

```powershell
Rename-Computer -NewName "DC300141657" -Restart
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
    -DomainName "DC300141657-00.local" `
    -DomainNetbiosName "DC300141657-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
```

* Je verifie que mon controlleur de donnaime est bien installer
  
```powershell
Get-ADDomain
```
<details>
    <summary>Output</summary>
    
```powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300141657-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300141657-00,DC=local
DistinguishedName                  : DC=DC300141657-00,DC=local
DNSRoot                            : DC300141657-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300141657-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300141657-00,DC=local
Forest                             : DC300141657-00.local
InfrastructureMaster               : DC3001491657.DC300141657-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300141657-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300141657-00,DC=local
ManagedBy                          :
Name                               : DC300141657-00
NetBIOSName                        : DC300141657-00
ObjectClass                        : domainDNS
ObjectGUID                         : e5a62b6c-651d-4984-94f5-f60a2d7d14e5
ParentDomain                       :
PDCEmulator                        : DC3001491657.DC300141657-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300141657-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC3001491657.DC300141657-00.local}
RIDMaster                          : DC3001491657.DC300141657-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300141657-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300141657-00,DC=local,
                                     CN=Configuration,DC=DC300141657-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300141657-00,DC=local
UsersContainer                     : CN=Users,DC=DC300141657-00,DC=local
```
</details>

```powershell
Get-ADForest
```
<details>
    <summary>Output</summary>
    
```powershell
ApplicationPartitions : {DC=DomainDnsZones,DC=DC300141657-00,DC=local, DC=ForestDnsZones,DC=DC300141657-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC3001491657.DC300141657-00.local
Domains               : {DC300141657-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC3001491657.DC300141657-00.local}
Name                  : DC300141657-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300141657-00,DC=local
RootDomain            : DC300141657-00.local
SchemaMaster          : DC3001491657.DC300141657-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
```
</details>

