```300151469```

pour toute les comande que j'ai utilise :
###
- Rename-Computer -NewName "DC300151469" -Restart
- Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
- Install-ADDSForest `
    -DomainName "DC300151469-00.local" `
    -DomainNetbiosName "DC300151469-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
Get-ADDomain
Get-ADForest

###

AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300151469-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300151469-00,DC=local
DistinguishedName                  : DC=DC300151469-00,DC=local
DNSRoot                            : DC300151469-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300151469-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300151469-00,DC=local
Forest                             : DC300151469-00.local
InfrastructureMaster               : DC300151469.DC300151469-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300151469-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300151469-00,DC=local
ManagedBy                          :
Name                               : DC300151469-00
NetBIOSName                        : DC300151469-00
ObjectClass                        : domainDNS
ObjectGUID                         : 675d32f9-a1f5-4562-8b2e-25fd58a8474b
ParentDomain                       :
PDCEmulator                        : DC300151469.DC300151469-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300151469-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151469.DC300151469-00.local}
RIDMaster                          : DC300151469.DC300151469-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300151469-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300151469-00,DC=local,
                                     CN=Configuration,DC=DC300151469-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300151469-00,DC=local
UsersContainer                     : CN=Users,DC=DC300151469-00,DC=local

ApplicationPartitions : {DC=ForestDnsZones,DC=DC300151469-00,DC=local, DC=DomainDnsZones,DC=DC300151469-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300151469.DC300151469-00.local
Domains               : {DC300151469-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300151469.DC300151469-00.local}
Name                  : DC300151469-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300151469-00,DC=local
RootDomain            : DC300151469-00.local
SchemaMaster          : DC300151469.DC300151469-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}

