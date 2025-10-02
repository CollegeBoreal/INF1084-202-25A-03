
PS C:\Users\Administrator> Import-Module ActiveDirectory
PS C:\Users\Administrator> Get-ADDomain


AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300151258,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300151258,DC=local
DistinguishedName                  : DC=DC300151258,DC=local
DNSRoot                            : DC300151258.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300151258,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300151258,DC=local
Forest                             : DC300151258.local
InfrastructureMaster               : DC300151258.DC300151258.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300151258,DC
                                     =local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300151258,DC=local
ManagedBy                          :
Name                               : DC300151258
NetBIOSName                        : D300151258
ObjectClass                        : domainDNS
ObjectGUID                         : 5b4c4568-db3c-4569-8317-c4c2b34a144b
ParentDomain                       :
PDCEmulator                        : DC300151258.DC300151258.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300151258,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151258.DC300151258.local}
RIDMaster                          : DC300151258.DC300151258.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300151258,DC=local,
                                     DC=DomainDnsZones,DC=DC300151258,DC=local,
                                     CN=Configuration,DC=DC300151258,DC=local}
SystemsContainer                   : CN=System,DC=DC300151258,DC=local
UsersContainer                     : CN=Users,DC=DC300151258,DC=local

PS C:\Users\Administrator> Get-ADForest


ApplicationPartitions : {DC=ForestDnsZones,DC=DC300151258,DC=local, DC=DomainDnsZones,DC=DC300151258,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300151258.DC300151258.local
Domains               : {DC300151258.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300151258.DC300151258.local}
Name                  : DC300151258.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300151258,DC=local
RootDomain            : DC300151258.local
SchemaMaster          : DC300151258.DC300151258.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
