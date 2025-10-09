##1-J'ai  Renommé le serveuur

Rename-Computer -NewName "DC-300151403" -Restart
2- Installer le rôle AD DS
Rename-Computer -NewName "DC9999999990" -Restart
3-Créer un nouveau domaine (nouvelle forêt)
Install-ADDSForest `
    -DomainName "DC999999999-00.local" `
    -DomainNetbiosName "DC999999999-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
  Install-ADDSForest

  Validating environment and user input
      All tests completed successfully                                                                                       [oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo]
      Installing new forest Starting

For more information about this setting, see Knowledge Base article 942564
(http://go.microsoft.com/fwlink/?LinkId=104751).

WARNING: This computer has at least one physical network adapter that does not have static IP address(es) assigned to
its IP Properties. If both IPv4 and IPv6 are enabled for a network adapter, both IPv4 and IPv6 static IP addresses
should be assigned to both IPv4 and IPv6 Properties of the physical network adapter. Such static IP address(es)
assignment should be done to all the physical network adapters for reliable Domain Name System (DNS) operation.

WARNING: A delegation for this DNS server cannot be created because the authoritative parent zone cannot be found or it
 does not run Windows DNS server. If you are integrating with an existing DNS infrastructure, you should manually
create a delegation to this DNS server in the parent zone to ensure reliable name resolution from outside the domain
"DC999999999.local". Otherwise, no action is required.

WARNING: Windows Server 2022 domain controllers have a default for the security setting named "Allow cryptography
algorithms compatible with Windows NT 4.0" that prevents weaker cryptography algorithms when establishing security
channel sessions.

For more information about this setting, see Knowledge Base article 942564
(http://go.microsoft.com/fwlink/?LinkId=104751).

WARNING: This computer has at least one physical network adapter that does not have static IP address(es) assigned to
its IP Properties. If both IPv4 and IPv6 are enabled for a network adapter, both IPv4 and IPv6 static IP addresses
should be assigned to both IPv4 and IPv6 Properties of the physical network adapter. Such static IP address(es)
assignment should be done to all the physical network adapters for reliable Domain Name System (DNS) operation.
4-  Vérifier l’installation
DC999999999\Administrator
Get-ADDomain
Get-ADForest
PS C:\Users\Administrator> Get-ADDomain


AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC-300151403-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC-300151403-00,DC=local
DistinguishedName                  : DC=DC-300151403-00,DC=local
DNSRoot                            : DC-300151403-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC-300151403-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC-300151403-00,DC=local
Forest                             : DC-300151403-00.local
InfrastructureMaster               : DC300151403-00.DC-300151403-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC-300151403-00,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC-300151403-00,DC=local
ManagedBy                          :
Name                               : DC-300151403-00
NetBIOSName                        : DC-300151403-00
ObjectClass                        : domainDNS
ObjectGUID                         : a9dd2dab-6035-482e-b0f1-e4c3be402545
ParentDomain                       :
PDCEmulator                        : DC300151403-00.DC-300151403-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC-300151403-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151403-00.DC-300151403-00.local}
RIDMaster                          : DC300151403-00.DC-300151403-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC-300151403-00,DC=local, DC=DomainDnsZones,DC=DC-300151403-00,DC=local, CN=Configuration,DC=DC-300151403-00,DC=local}
SystemsContainer                   : CN=System,DC=DC-300151403-00,DC=local
UsersContainer                     : CN=Users,DC=DC-300151403-00,DC=local

PS C:\Users\Administrator> Get-ADForest


ApplicationPartitions : {DC=ForestDnsZones,DC=DC-300151403-00,DC=local, DC=DomainDnsZones,DC=DC-300151403-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300151403-00.DC-300151403-00.local
Domains               : {DC-300151403-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300151403-00.DC-300151403-00.local}
Name                  : DC-300151403-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC-300151403-00,DC=local
RootDomain            : DC-300151403-00.local
SchemaMaster          : DC300151403-00.DC-300151403-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}

