1️⃣ **Renommer la machine**

Rename-Computer -NewName "DC300141625" -Restart

2️⃣ Installer Active Directory
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Output attendu : services installés et DNS opérationnel.

3️⃣ Créer une nouvelle forêt AD
Install-ADDSForest `
    -DomainName "DC300141625-00.local" `
    -DomainNetbiosName "DC300141625-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Fatima1234@" -AsPlainText -Force) `
    -Force

4️⃣ Vérifier le contrôleur de domaine
Get-ADDomain
ComputersContainer  : CN=Computers,DC=DC300141625-00,DC=local
DistinguishedName   : DC=DC300141625-00,DC=local
DNSRoot             : DC300141625-00.local
DomainControllersContainer : OU=Domain Controllers,DC=DC300141625-00,DC=local
DomainMode          : Windows2016Domain
Forest              : DC300141625-00.local
InfrastructureMaster: DC300141625.DC300141625-00.local
PDCEmulator         : DC300141625.DC300141625-00.local
RIDMaster           : DC300141625.DC300141625-00.local
UsersContainer      : CN=Users,DC=DC300141625-00,DC=local


5️⃣ Vérifier la forêt Active Directory
Get-ADForest
ApplicationPartitions : {DC=DomainDnsZones,DC=DC300141625-00,DC=local, DC=ForestDnsZones,DC=DC300141625-00,DC=local}
DomainNamingMaster    : DC300141625.DC300141625-00.local
Domains               : {DC300141625-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300141625.DC300141625-00.local}
Name                  : DC300141625-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300141625-00,DC=local
RootDomain            : DC300141625-00.local
SchemaMaster          : DC300141625.DC300141625-00.local
Sites                 : {Default-First-Site-Name}
