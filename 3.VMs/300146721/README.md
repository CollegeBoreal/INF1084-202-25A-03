# 🧩 Atelier : Installation d’un Contrôleur de Domaine (Active Directory) sur Windows Server 2022

## 🎯 Objectif
Installer et configurer un **contrôleur de domaine Active Directory (AD DS)** à l’aide de **PowerShell** sur **Windows Server 2022**.
### 1.J'ai renommé le nom de la machine
```powershell
Rename-Computer -NewName "DC300146721" -Restart
```
###   2.J'installe Active Directory
```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```
###   3.Je vérifie que mon contrôleur de donnaime est bien installé
```powershell
Get-ADDomain
```
```txt

AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300146721_001,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300146721_001,DC=local
DistinguishedName                  : DC=DC300146721_001,DC=local
DNSRoot                            : DC300146721_001.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300146721_001,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300146721_001,DC=local
Forest                             : DC300146721_001.local
InfrastructureMaster               : DC300146721.DC300146721_001.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300146721_001,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300146721_001,DC=local
ManagedBy                          :
Name                               : DC300146721_001
NetBIOSName                        : DC300146721_001
ObjectClass                        : domainDNS
ObjectGUID                         : bc52f22a-5f90-4e80-939d-890aa6e70831
ParentDomain                       :
PDCEmulator                        : DC300146721.DC300146721_001.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300146721_001,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300146721.DC300146721_001.local}
RIDMaster                          : DC300146721.DC300146721_001.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300146721_001,DC=local, DC=DomainDnsZones,DC=DC300146721_001,DC=local, CN=Configuration,DC=DC300146721_001,DC=local}
```

```powershell
Get-ADForest
```
```txt

 ApplicationPartitions : {DC=ForestDnsZones,DC=DC300146721_001,DC=local, DC=DomainDnsZones,DC=DC300146721_001,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300146721.DC300146721_001.local
Domains               : {DC300146721_001.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300146721.DC300146721_001.local}
Name                  : DC300146721_001.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300146721_001,DC=local
RootDomain            : DC300146721_001.local
SchemaMaster          : DC300146721.DC300146721_001.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
SystemsContainer                   : CN=System,DC=DC300146721_001,DC=local
UsersContainer                     : CN=Users,DC=DC300146721_001,DC=local

```
