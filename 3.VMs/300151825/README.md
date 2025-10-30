# 300151825

🖥️ 1. Renommer la machine

```powershell
Rename-Computer -NewName "DC300151825" -Restart 
```

🧩 2. Installer le rôle Active Directory Domain Services (AD DS)  

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 
```

✨ Resultat ✨:

```powershell
#Success Restart Needed Exit Code Feature Result  
True No Success {Active Directory Domain Services, Group P...
```

🌐 3. Créer un nouveau domaine   
```powershell
Install-ADDSForest `
    -DomainName "DC300151825-00.local" `
    -DomainNetbiosName "DC300151825-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
```

🔍 4. Vérifier la création du domaine  

```powershell
Get-ADDomain                                                                                 
```

✨ Resultat ✨: 


```powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300151825-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300151825-00,DC=local
DistinguishedName                  : DC=DC300151825-00,DC=DC300151825-00,DC=local
DNSRoot                            : DC300151825-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300151825-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300151825-00,DC=local
Forest                             : DC300151825-00.local
InfrastructureMaster               : DC300151825.DC300151825-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300151825-00,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300151825-00,DC=local
ManagedBy                          :
Name                               : DC300151825-00
NetBIOSName                        : DC300151825-00
ObjectClass                        : domainDNS
ObjectGUID                         : 6a8d72e4-ba5c-40ad-a8c5-d9e16cf7e0aa
ParentDomain                       :
PDCEmulator                        : DC300151825.DC300151825-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300151825-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151825.DC300151825-00.local}
RIDMaster                          : DC300151825.DC300151825-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300151825-00,DC=local, DC=DomainDnsZones,DC=DC300151825-00,DC=local, CN=Configuration,DC=DC300151825-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300151825-00,DC=local
UsersContainer                     : CN=Users,DC=DC300151825-00,DC=local
```


🌳 5. Vérifier la configuration de la forêt Active Directory  

```powershell
Get-ADForest
```


✨ Resultat ✨:

```powershell
ApplicationPartitions : {DC=DomainDnsZones,DC=DC300151825-00,DC=local, DC=ForestDnsZones,DC=DC300151825-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300151825.DC300151825-00.local
Domains               : {DC300151825-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300151825.DC300151825-00.local}
Name                  : DC300151825-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300151825-00,DC=local
RootDomain            : DC300151825-00.local
SchemaMaster          : DC300151825.DC300151825-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
```
