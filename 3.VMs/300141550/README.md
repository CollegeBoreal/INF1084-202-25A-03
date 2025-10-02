# 300141550



- [ ] Exercice 2

``` powershell

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

```
- [ ] resultat :  
Success Restart Needed Exit Code      Feature Result                               
------- -------------- ---------      --------------                               
True    No             NoChangeNeeded {}                                           

- [ ] exercice 3
      
``` powershell

Install-ADDSForest -DomainName "DC300141550.local" `
                   -DomainNetbiosName "DC300141550" `
                   -InstallDns:$true `
                   -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
                   -Force
```
j'ai du changer, mettre un nouveau nom pour le "DomainNetbiosName". 



- [ ] Exercice 4

``` powershell
<<<<<<< HEAD
DC300141550\Administrator
=======
MONDOMAINE\Administrateur
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
```

- [ ] resultat :
      
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300141550,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300141550,DC=local
DistinguishedName                  : DC=DC300141550,DC=local
DNSRoot                            : DC300141550.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300141550,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300141550,DC=local
Forest                             : DC300141550.local
InfrastructureMaster               : DC300141550.DC300141550.local
LastLogonReplicationInterval       : 
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC30
                                     0141550,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300141550,DC=local
ManagedBy                          : 
Name                               : DC300141550
NetBIOSName                        : DC3000141550
ObjectClass                        : domainDNS
ObjectGUID                         : 83e291d5-7325-4143-b8f5-63531621ef3e
ParentDomain                       : 
PDCEmulator                        : DC300141550.DC300141550.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300141550,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300141550.DC300141550.local}
RIDMaster                          : DC300141550.DC300141550.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300141550,DC=local, 
                                     DC=DomainDnsZones,DC=DC300141550,DC=local, 
                                     CN=Configuration,DC=DC300141550,DC=local}
SystemsContainer                   : CN=System,DC=DC300141550,DC=local
UsersContainer                     : CN=Users,DC=DC300141550,DC=local

ApplicationPartitions : {DC=ForestDnsZones,DC=DC300141550,DC=local, 
                        DC=DomainDnsZones,DC=DC300141550,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300141550.DC300141550.local
Domains               : {DC300141550.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300141550.DC300141550.local}
Name                  : DC300141550.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300141550,DC=local
RootDomain            : DC300141550.local
SchemaMaster          : DC300141550.DC300141550.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}

      
