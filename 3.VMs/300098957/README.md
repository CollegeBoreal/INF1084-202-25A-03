# 300098957

Server: `10.7.236.170`

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
    -DomainName "DC300098957-90.local" `
    -DomainNetbiosName "DC300098957-90" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
```

```powershell
Get-ADDomain
```
<details>
    <summary>Output</summary>
    
```powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300098957-90,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300098957-90,DC=local
DistinguishedName                  : DC=DC300098957-90,DC=local
DNSRoot                            : DC300098957-90.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300098957-90,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300098957-90,DC=local
Forest                             : DC300098957-90.local
InfrastructureMaster               : VM01.DC300098957-90.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300098957-90
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300098957-90,DC=local
ManagedBy                          :
Name                               : DC300098957-90
NetBIOSName                        : DC300098957-90
ObjectClass                        : domainDNS
ObjectGUID                         : bdd21e09-5748-4015-8b69-1ebdd9d14bef
ParentDomain                       :
PDCEmulator                        : VM01.DC300098957-90.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300098957-90,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {VM01.DC300098957-90.local}
RIDMaster                          : VM01.DC300098957-90.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300098957-90,DC=local,
                                     DC=DomainDnsZones,DC=DC300098957-90,DC=local,
                                     CN=Configuration,DC=DC300098957-90,DC=local}
SystemsContainer                   : CN=System,DC=DC300098957-90,DC=local
UsersContainer                     : CN=Users,DC=DC300098957-90,DC=local```
</details>

```powershell
Get-ADForest
```
<details>
    <summary>Output</summary>
    
```powershell
ApplicationPartitions : {DC=ForestDnsZones,DC=DC300098957-90,DC=local, DC=DomainDnsZones,DC=DC300098957-90,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : VM01.DC300098957-90.local
Domains               : {DC300098957-90.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {VM01.DC300098957-90.local}
Name                  : DC300098957-90.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300098957-90,DC=local
RootDomain            : DC300098957-90.local
SchemaMaster          : VM01.DC300098957-90.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
```
</details>
