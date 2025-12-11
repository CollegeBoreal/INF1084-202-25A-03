# 300151825
---

# Lister tous les services liés à AD
```powershell
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName
```
Resultat:
```powershell
Status   Name               DisplayName
------   ----               -----------
Running  NTDS               Active Directory Domain Services
Running  ADWS               Active Directory Web Services
Running  DFSR               DFS Replication
Running  IsmServ            Intersite Messaging
Running  Kdc                Kerberos Key Distribution Center
Running  Netlogon           Netlogon
```
```powershell
# Vérifier l’état d’un service spécifique
Get-Service -Name NTDS, ADWS, DFSR
```
Resultat:
```powershell
Status   Name               DisplayName
------   ----               -----------
Running  ADWS               Active Directory Web Services
Running  DFSR               DFS Replication
Running  NTDS               Active Directory Domain Services
```
# Afficher les 20 derniers événements liés à NTDS
```powershell
Get-EventLog -LogName "Directory Service" -Newest 20
```
Resultat:
```powershell
   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
      71 Dec 10 12:01  Information NTDS General           1073744851 Internal event: Online Defragment Start succeed...
      70 Dec 10 12:01  Information NTDS General           1073744857 Internal event: Online Defragment Stop invoked ...
      69 Dec 10 12:01  Information NTDS General           1073743693 Active Directory Domain Services has located a ...
      68 Dec 10 12:01  Information NTDS ISAM                     701 NTDS (844,D,0) NTDSA: Online defragmentation ha...
      67 Dec 10 12:01  Information NTDS ISAM                     700 NTDS (844,D,0) NTDSA: Online defragmentation is...
      66 Dec 10 12:01  Information NTDS ISAM                     330 NTDS (844,D,2) NTDSA: The database [C:\Windows\...
      65 Dec 10 12:01  Information NTDS ISAM                     326 NTDS (844,D,50) NTDSA: The database engine atta...
      64 Dec 10 12:01  Information NTDS ISAM                     330 NTDS (844,D,50) NTDSA: The database [C:\Windows...
      63 Dec 10 12:01  Information NTDS ISAM                     105 NTDS (844,D,0) NTDSA: The database engine start...
      62 Dec 10 12:01  Information NTDS ISAM                     102 NTDS (844,P,98) NTDSA: The database engine (10....
      61 Dec 10 11:51  Information NTDS General           1073744786 Created 8 optional system indices.
      60 Dec 10 11:51  Information NTDS General           1073743838 Active Directory Domain Services successfully c...
      59 Dec 10 11:51  Information NTDS General           1073743837 Active Directory Domain Services is rebuilding ...
      58 Dec 10 11:51  Information NTDS General           1073744785 Creating 8 optional system indices....
      57 Dec 10 11:48  Information NTDS General           1073743889 Active Directory Domain Services has completed ...
      56 Dec 10 11:47  Information NTDS General           1073743228 This directory service is now the intersite top...
      55 Dec 10 11:47  Information NTDS General           1073743218 All problems preventing updates to the Active D...
      54 Dec 10 11:46  Information NTDS General           1073742824 Microsoft Active Directory Domain Services star...
      53 Dec 10 11:46  Warning     NTDS General           2147486689 The security of this directory server can be si...
      52 Dec 10 11:46  Warning     NTDS General           2147486534 The security of this directory server can be si...
Get-EventLog -LogName "Directory Service" -Newest 20
```
---

```powershell
# Afficher les logs du système
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
```
---

```powershell
# Afficher les logs via le journal moderne (Event Viewer v2)
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 | Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
```

Resultat:
```powershell
TimeCreated              Id LevelDisplayName Message
-----------              -- ---------------- -------
12/10/2025 12:01:55 PM 3027 Information      Internal event: Online Defragment Start succeeded. ...
12/10/2025 12:01:55 PM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
12/10/2025 12:01:54 PM 1869 Information      Active Directory Domain Services has located a global catalog in the fo...
12/10/2025 12:01:55 PM  701 Information      NTDS (844,D,0) NTDSA: Online defragmentation has completed a full pass ...
12/10/2025 12:01:55 PM  700 Information      NTDS (844,D,0) NTDSA: Online defragmentation is beginning a full pass o...
12/10/2025 12:01:55 PM  330 Information      NTDS (844,D,2) NTDSA: The database [C:\Windows\NTDS\temp.edb] format ve...
12/10/2025 12:01:55 PM  326 Information      NTDS (844,D,50) NTDSA: The database engine attached a database (1, C:\W...
12/10/2025 12:01:55 PM  330 Information      NTDS (844,D,50) NTDSA: The database [C:\Windows\NTDS\ntds.dit] format v...
12/10/2025 12:01:55 PM  105 Information      NTDS (844,D,0) NTDSA: The database engine started a new instance (0). (...
12/10/2025 12:01:55 PM  102 Information      NTDS (844,P,98) NTDSA: The database engine (10.00.20348.0000) is starti...
12/10/2025 11:51:44 AM 2962 Information      Created 8 optional system indices.
12/10/2025 11:51:44 AM 2014 Information      Active Directory Domain Services successfully completed rebuilding the ...
12/10/2025 11:51:44 AM 2013 Information      Active Directory Domain Services is rebuilding the following number of ...
12/10/2025 11:51:44 AM 2961 Information      Creating 8 optional system indices....
12/10/2025 11:48:54 AM 2065 Information      Active Directory Domain Services has completed rebuilding the quota-tra...
12/10/2025 11:47:29 AM 1404 Information      This directory service is now the intersite topology generator and has ...
12/10/2025 11:47:24 AM 1394 Information      All problems preventing updates to the Active Directory Domain Services...
12/10/2025 11:46:54 AM 1000 Information      Microsoft Active Directory Domain Services startup complete
12/10/2025 11:46:54 AM 3041 Warning          The security of this directory server can be significantly enhanced by ...
12/10/2025 11:46:54 AM 2886 Warning          The security of this directory server can be significantly enhanced by ...
```
---

```powershell
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```
Resultat:
```powershell
 Directory: C:\

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        12/10/2025  12:18 PM                Logs

```

```powershell
Stop-Service -Name DFSR
(Get-Service -name DFSR).status
```
Resultat:
```powershell
Stopped
```

```powershell
Start-Service -Name DFSR
```
