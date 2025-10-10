# 300148094

* J'ai renommer le nom de la machine

```powershell
Rename-Computer -NewName "DC300148094" -Restart
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
    -DomainName "DC300148094-00.local" `
    -DomainNetbiosName "DC300148094-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "boreal2024@" -AsPlainText -Force) `
    -Force
```

* je me connect a mon domaine avec le nom d'utilisateur ci dessous et le mot de passe de la VM

DC300148094-00\Administrator

<img src="images/photo1.jpg" alt="Images" width="450"/>

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
ComputersContainer                 : CN=Computers,DC=DC300148094-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300148094-00,DC=local
DistinguishedName                  : DC=DC300148094-00,DC=local
DNSRoot                            : DC300148094-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300148094-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300148094-00,DC=local
Forest                             : DC300148094-00.local
InfrastructureMaster               : DC300148094.DC300148094-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300148094-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300148094-00,DC=local
ManagedBy                          :
Name                               : DC300148094-00
NetBIOSName                        : DC300148094-00
ObjectClass                        : domainDNS
ObjectGUID                         : 64330a8c-86c0-4cbb-8c41-e38d5c95da97
ParentDomain                       :
PDCEmulator                        : DC300148094.DC300148094-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300148094-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300148094.DC300148094-00.local}
RIDMaster                          : DC300148094.DC300148094-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300148094-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300148094-00,DC=local,
                                     CN=Configuration,DC=DC300148094-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300148094-00,DC=local
UsersContainer                     : CN=Users,DC=DC300148094-00,DC=local
```
</details>

```powershell
Get-ADForest
```
<details>
    <summary>Output</summary>
    
```powershell
ApplicationPartitions : {DC=DomainDnsZones,DC=DC300148094-00,DC=local, DC=ForestDnsZones,DC=DC300148094-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300148094.DC300148094-00.local
Domains               : {DC300148094-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300148094.DC300148094-00.local}
Name                  : DC300148094-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300148094-00,DC=local
RootDomain            : DC300148094-00.local
SchemaMaster          : DC300148094.DC300148094-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
</details>

