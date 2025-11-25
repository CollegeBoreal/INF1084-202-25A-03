
## ** Zakaria Djellouli 300150433 — Installation du Domaine Active Directory**

### ✔️ J’ai renommé le nom de la machine

```powershell
Rename-Computer -NewName "DC300150433" -Restart
```

Le serveur redémarre automatiquement.

---

### ✔️ J’installe Active Directory

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

---

### ✔️ J’ajoute une nouvelle forêt à mon AD

```powershell
Install-ADDSForest `
    -DomainName "DC300150433-00.local" `
    -DomainNetbiosName "DC300150433-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force
```

Le serveur redémarre à la fin de l’installation.

---



# ✔️ Vérification du contrôleur de domaine

### Commande :

```powershell
Get-ADDomain
```

### Output réel :

```
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300150433-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300150433-00,DC=local
DistinguishedName                  : DC=DC300150433-00,DC=local
DNSRoot                            : DC300150433-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300150433-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300150433-00,DC=local
Forest                             : DC300150433-00.local
InfrastructureMaster               : DC300150433.DC300150433-00.local
NetBIOSName                        : DC300150433-00
ReplicaDirectoryServers            : {DC300150433.DC300150433-00.local}
RIDMaster                          : DC300150433.DC300150433-00.local
PDCEmulator                        : DC300150433.DC300150433-00.local
UsersContainer                     : CN=Users,DC=DC300150433-00,DC=local
```

---

### Commande :

```powershell
Get-ADForest
```

### Output réel :

```
ApplicationPartitions : {DC=ForestDnsZones,DC=DC300150433-00,DC=local, DC=DomainDnsZones,DC=DC300150433-00,DC=local}
DomainNamingMaster    : DC300150433.DC300150433-00.local
Domains               : {DC300150433-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300150433.DC300150433-00.local}
RootDomain            : DC300150433-00.local
SchemaMaster          : DC300150433.DC300150433-00.local
Sites                 : {Default-First-Site-Name}
```

---


