*Ramatoulaye Diallo: 300153476*
************************************************************************************************************************************************
PS C:\Users\Administrator> Get-ADDomain                                                                                 

AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC999999999-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC999999999-00,DC=local
DistinguishedName                  : DC=DC999999999-00,DC=local
DNSRoot                            : DC999999999-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC999999999-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC999999999-00,DC=local
Forest                             : DC999999999-00.local
InfrastructureMaster               : DC300153476.DC999999999-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC999999999-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC999999999-00,DC=local
ManagedBy                          :
Name                               : DC999999999-00
NetBIOSName                        : DC999999999-00
ObjectClass                        : domainDNS
ObjectGUID                         : 50a87449-9421-42d5-8b77-7db46c79a75f
ParentDomain                       :
PDCEmulator                        : DC300153476.DC999999999-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC999999999-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300153476.DC999999999-00.local}
RIDMaster                          : DC300153476.DC999999999-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC999999999-00,DC=local,
                                     DC=DomainDnsZones,DC=DC999999999-00,DC=local,
                                     CN=Configuration,DC=DC999999999-00,DC=local}
SystemsContainer                   : CN=System,DC=DC999999999-00,DC=local
UsersContainer                     : CN=Users,DC=DC999999999-00,DC=local
********************************************************************************************************************************************
PS C:\Users\Administrator> Get-ADForest


ApplicationPartitions : {DC=DomainDnsZones,DC=DC999999999-00,DC=local, DC=ForestDnsZones,DC=DC999999999-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300153476.DC999999999-00.local
Domains               : {DC999999999-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300153476.DC999999999-00.local}
Name                  : DC999999999-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC999999999-00,DC=local
RootDomain            : DC999999999-00.local
SchemaMaster          : DC300153476.DC999999999-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}






