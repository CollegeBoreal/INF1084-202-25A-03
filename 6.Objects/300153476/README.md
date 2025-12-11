# 🧩 INF1084 – Laboratoire : Création d’un partage, d’utilisateurs, d’une GPO et activation RDP via PowerShell

Ce laboratoire consiste à automatiser entièrement, via PowerShell :

✔️ La création d’un dossier partagé  
✔️ La création d’un groupe AD et d’utilisateurs  
✔️ Le partage SMB avec permissions  
✔️ La création et liaison d’une GPO pour mapper un lecteur réseau  
✔️ L’activation de la connexion RDP pour un groupe  
✔️ Le test final sur une VM membre  

---

# 📌 1. Pré-requis

- 🖥️ **Windows Server 2022**  
- 📦 **AD DS installé et fonctionnel**  
- 📦 Modules PowerShell :  
  - `ActiveDirectory`  
  - `GroupPolicy`  
- 👥 Une VM membre jointe au domaine  
- 📁 Votre script `bootstrap.ps1` du dossier `4.OUs` (dot-sourcing)

```powershell
. "C:\chemin\vers\bootstrap.ps1"
```
## 📄 Résultat obtenu

### 📁 Création du dossier « SharedResources »
    Directory: C:\

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/13/2025   6:23 PM                SharedResources

### 📤 Création du partage SMB
```
AvailabilityType      : NonClustered
CachingMode           : Manual
CATimeout             : 0
CompressData          : False
ConcurrentUserLimit   : 0
ContinuouslyAvailable : False
CurrentUsers          : 0
Description           :
EncryptData           : False
FolderEnumerationMode : Unrestricted
IdentityRemoting      : False
Infrastructure        : False
LeasingMode           : Full
Name                  : SharedResources
Path                  : C:\SharedResources
Scoped                : False
ScopeName             : *
SecurityDescriptor    : O:SYG:SYD:(A;;FA;;;S-1-5-21-447135690-91861430-3213525697-1104)
ShadowCopy            : False
ShareState            : Online
ShareType             : FileSystemDirectory
SmbInstance           : Default
Special               : False
Temporary             : False
Volume                : \\?\Volume{d9f7716d-765c-4de2-bbd2-1c33f3e87e19}\
PSComputerName        :
PresetPathAcl         : System.Security.AccessControl.DirectorySecurity
```

✔️ Le partage SMB est actif et fonctionne sans erreur.


---

## ✅ 2. Exécution de `utilisateurs2.ps1`

### 💻 Commande exécutée :
.\utilisateurs2.ps1

### 📄 Résultat obtenu :

#### 📘 Création de la GPO « MapSharedFolder »
```
DisplayName : MapSharedFolder
DomainName : DC300153476-00.local
Owner : DC300153476-00\Domain Admins
Id : fc68e2b3-7ccd-4e77-94d3-63f053f6a759
GpoStatus : AllSettingsEnabled
Description :
CreationTime : 11/13/2025 6:24:11 PM
ModificationTime : 11/13/2025 6:24:11 PM
UserVersion : AD Version: 0, SysVol Version: 0
ComputerVersion : AD Version: 0, SysVol Version: 0
WmiFilter :
```
