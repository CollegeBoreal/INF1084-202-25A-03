# 300150195

```powershell
PS C:\Users\Administrator> Import-Module ActiveDirectory
PS C:\Users\Administrator> Get-ADDomain

```
<details>
<summary>Output</summary>


***powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300150195-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300150195-00,DC=local
DistinguishedName                  : DC=DC300150195-00,DC=local
DNSRoot                            : DC300150195-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300150195-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300150195-00,DC=local
Forest                             : DC300150195-00.local
InfrastructureMaster               : DC300150195.DC300150195-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300150195-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300150195-00,DC=local
ManagedBy                          :
Name                               : DC300150195-00
NetBIOSName                        : DC300150195-00
ObjectClass                        : domainDNS
ObjectGUID                         : a079f1a3-3fce-4f62-9469-d9ce1a1832a0
ParentDomain                       :
PDCEmulator                        : DC300150195.DC300150195-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300150195-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300150195.DC300150195-00.local}
RIDMaster                          : DC300150195.DC300150195-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300150195-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300150195-00,DC=local,
                                     CN=Configuration,DC=DC300150195-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300150195-00,DC=local
UsersContainer                     : CN=Users,DC=DC300150195-00,DC=local
```

</details>

PS C:\Users\Administrator> Get-ADForest


ApplicationPartitions : {DC=DomainDnsZones,DC=DC300150195-00,DC=local, DC=ForestDnsZones,DC=DC300150195-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300150195.DC300150195-00.local
Domains               : {DC300150195-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300150195.DC300150195-00.local}
Name                  : DC300150195-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300150195-00,DC=local
RootDomain            : DC300150195-00.local
SchemaMaster          : DC300150195.DC300150195-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
