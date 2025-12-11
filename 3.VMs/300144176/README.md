# 300144176



- [ ] Exercice 2
``` powershell



Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

``` powershell
- [ ] resultat :  
Success Restart Needed Exit Code      Feature Result                               
------- -------------- ---------      --------------                               
True    No             NoChangeNeeded {}                                           







exercice 3

1. Renommage de la machine
Rename-Co
mputer -NewName "DC300144176" -Restart

🔹 2. Installation du rôle Active Directory Domain Services
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

</details>

🔹 3. Création d’une nouvelle forêt Active Directory
Install-ADDSForest `
    -DomainName "DC300144176-01.local" `
    -DomainNetbiosName "DC300144176-01" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "awa&" -AsPlainText -Force) `
    -Force
</details>
🔹 4. Connexion au domaine

Se connecter avec :
Utilisateur : DC300144176-01\Administrator
Mot de passe : celui de la VM










execrice 4
🔹 5. Vérification de l’installation du contrôleur de domaine
Get-ADDomain


`` Get-ADDomain





AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300144176-01,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300144176-01,DC=local
DistinguishedName                  : DC=DC300144176-01,DC=local
DNSRoot                            : DC300144176-01.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300144176-01,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300144176-01,DC=local
Forest                             : DC300144176-01.local
InfrastructureMaster               : DC300144176.DC300144176-01.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300144176-01
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300144176-01,DC=local
ManagedBy                          :
Name                               : DC300144176-01
NetBIOSName                        : DC300144176-01
ObjectClass                        : domainDNS
ObjectGUID                         : 06648a36-9e3c-4d50-8066-b612eaa57672
ParentDomain                       :
PDCEmulator                        : DC300144176.DC300144176-01.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300144176-01,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300144176.DC300144176-01.local}
RIDMaster                          : DC300144176.DC300144176-01.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300144176-01,DC=local,
                                     DC=DomainDnsZones,DC=DC300144176-01,DC=local,
                                     CN=Configuration,DC=DC300144176-01,DC=local}
SystemsContainer                   : CN=System,DC=DC300144176-01,DC=local
UsersContainer                     : CN=Users,DC=DC300144176-01,DC=local






``Get-ADForest


ApplicationPartitions : {DC=ForestDnsZones,DC=DC300144176-01,DC=local, DC=DomainDnsZones,DC=DC300144176-01,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300144176.DC300144176-01.local
Domains               : {DC300144176-01.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300144176.DC300144176-01.local}
Name                  : DC300144176-01.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300144176-01,DC=local
RootDomain            : DC300144176-01.local
SchemaMaster          : DC300144176.DC300144176-01.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}
