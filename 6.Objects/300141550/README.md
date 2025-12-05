mon fichier README.md

- [ ]  utilisateur 1
``` sh
.\utilisateurs.ps1
```
``` powershell

    Directory: C:\


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/14/2025  11:01 AM                SharedResources

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
SecurityDescriptor    : O:SYG:SYD:(A;;FA;;;S-1-5-21-447135690-91861430-3213525697-1108)
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
<img width="819" height="430" alt="image" src="https://github.com/user-attachments/assets/87a60c0d-2dbf-4d02-a45c-fc312abfdce6" />

- [ ]  utilisateur 2
``` sh
.\utilisateurs2.ps1
```
``` powershell

DisplayName      : MapSharedFolder
DomainName       : DC300141550.local
Owner            : DC3000141550\Domain Admins
Id               : 0e3381e3-4778-4b48-9ac2-152daddcb6d2
GpoStatus        : AllSettingsEnabled
Description      :
CreationTime     : 11/14/2025 11:03:10 AM
ModificationTime : 11/14/2025 11:03:10 AM
UserVersion      : AD Version: 0, SysVol Version: 0
ComputerVersion  : AD Version: 0, SysVol Version: 0
WmiFilter        :

New-GPLink : Unknown error (0x80005000)
At C:\Users\Administrator\INF1084-202-25A-03\6.Objects\300141550\utilisateurs2.ps1:9 char:1
+ New-GPLink -Name $GPOName -Target $OU
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (:) [New-GPLink], COMException
    + FullyQualifiedErrorId : System.Runtime.InteropServices.COMException,Microsoft.GroupPolicy.Commands.NewGPLinkCommand


PSPath            : Microsoft.PowerShell.Core\FileSystem::C:\Scripts
PSParentPath      : Microsoft.PowerShell.Core\FileSystem::C:\
PSChildName       : Scripts
PSDrive           : C
PSProvider        : Microsoft.PowerShell.Core\FileSystem
PSIsContainer     : True
Name              : Scripts
FullName          : C:\Scripts
Parent            :
Exists            : True
Root              : C:\
Extension         :
CreationTime      : 11/14/2025 11:03:11 AM
CreationTimeUtc   : 11/14/2025 4:03:11 PM
LastAccessTime    : 11/14/2025 11:03:11 AM
LastAccessTimeUtc : 11/14/2025 4:03:11 PM
LastWriteTime     : 11/14/2025 11:03:11 AM
LastWriteTimeUtc  : 11/14/2025 4:03:11 PM
Attributes        : Directory
Mode              : d-----
BaseName          : Scripts
Target            : {}
LinkType          :

DisplayName      : MapSharedFolder
DomainName       : DC300141550.local
Owner            : DC3000141550\Domain Admins
Id               : 0e3381e3-4778-4b48-9ac2-152daddcb6d2
GpoStatus        : AllSettingsEnabled
Description      :
CreationTime     : 11/14/2025 11:03:10 AM
ModificationTime : 11/14/2025 11:03:10 AM
UserVersion      : AD Version: 1, SysVol Version: 1
ComputerVersion  : AD Version: 0, SysVol Version: 0
WmiFilter        :

```
<img width="770" height="177" alt="image" src="https://github.com/user-attachments/assets/424cc8e3-756a-45d9-90e1-97de6ac55b38" />
<img width="843" height="414" alt="image" src="https://github.com/user-attachments/assets/aeec819a-acf6-47b0-bc64-590c53bfdd9c" /> 


- [ ]  utilisateur 3
``` sh
.\utilisateurs3.ps1
```
``` powershell
The task has completed successfully.
See log %windir%\security\logs\scesrv.log for detail info.
```
<img width="969" height="70" alt="image" src="https://github.com/user-attachments/assets/145ab3f5-1cd5-4141-966f-976cbd180b6b" />




verification : 
NetBios : DC300141550
