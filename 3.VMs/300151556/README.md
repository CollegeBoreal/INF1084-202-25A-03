#300151556

# J'ai renommé mon serveur

```powershell
Rename-Computer -NewName "DC300151556" -Restart
```

# j'ai installé active directory

```powershell
Rename-Computer -NewName "DC300151556" -Restart
```
# J'ai crée un nouveau domaine

```powershell
Install-ADDSForest `
    -DomainName "DC300151556-00.local" `
    -DomainNetbiosName "DC300151556-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
   ```

# J'ai verifié:
```powershell
Get-ADDomain
```
 #Le resultat est:

 ```powershell
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300151556-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300151556-00,DC=local
DistinguishedName                  : DC=DC300151556-00,DC=local
DNSRoot                            : DC300151556-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300151556-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300151556-00,DC=local
Forest                             : DC300151556-00.local
InfrastructureMaster               : DC300151556.DC300151556-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300151556-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300151556-00,DC=local
ManagedBy                          :
Name                               : DC300151556-00
NetBIOSName                        : DC300151556-00
ObjectClass                        : domainDNS
ObjectGUID                         : c31beb94-b154-4de9-8d88-0572b10ff6d4
ParentDomain                       :
PDCEmulator                        : DC300151556.DC300151556-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300151556-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151556.DC300151556-00.local}
RIDMaster                          : DC300151556.DC300151556-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300151556-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300151556-00,DC=local,
                                     CN=Configuration,DC=DC300151556-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300151556-00,DC=local
UsersContainer                     : CN=Users,DC=DC300151556-00,DC=local
```

```powershell
Get-ADForest
```

 #Le resultat est:
 
  ```powershell
 
 ApplicationPartitions : {DC=DomainDnsZones,DC=DC300151556-00,DC=local, DC=ForestDnsZones,DC=DC300151556-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300151556.DC300151556-00.local
Domains               : {DC300151556-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300151556.DC300151556-00.local}
Name                  : DC300151556-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300151556-00,DC=local
RootDomain            : DC300151556-00.local
SchemaMaster          : DC300151556.DC300151556-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
```


    
