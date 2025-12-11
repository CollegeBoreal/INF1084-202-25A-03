- [ ]  service1
``` sh
.\services1.ps1
```
``` powershell
Status   Name               DisplayName
------   ----               -----------
Running  NTDS               Active Directory Domain Services
Running  ADWS               Active Directory Web Services
Running  DFSR               DFS Replication
Running  IsmServ            Intersite Messaging
Running  Kdc                Kerberos Key Distribution Center
Running  Netlogon           Netlogon
Running  ADWS               Active Directory Web Services
Running  DFSR               DFS Replication
Running  NTDS               Active Directory Domain Services
```
<img width="786" height="207" alt="image" src="https://github.com/user-attachments/assets/532f4068-80b4-4011-b3ad-a21d68a30128" />

- [ ]  service2
``` sh
.\services2.ps1
```
``` powershell
 Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
     527 Nov 13 06:40  Information NTDS General           1073744851 Internal event: Online Defragment Start succeeded....
     526 Nov 13 06:40  Information NTDS General           1073744857 Internal event: Online Defragment Stop invoked but defrag was not running.
     525 Nov 13 06:40  Information NTDS ISAM                     701 NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freei...
     524 Nov 13 06:40  Information NTDS ISAM                     700 NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
     523 Nov 13 06:25  Information NTDS General           1073742986 Internal event: The Address Book hierarchy table has been rebuilt.
     522 Nov 12 18:40  Information NTDS General           1073744851 Internal event: Online Defragment Start succeeded....
     521 Nov 12 18:40  Information NTDS General           1073744857 Internal event: Online Defragment Stop invoked but defrag was not running.
     520 Nov 12 18:40  Information NTDS ISAM                     701 NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freei...
     519 Nov 12 18:40  Information NTDS ISAM                     700 NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
     518 Nov 12 18:25  Information NTDS General           1073742986 Internal event: The Address Book hierarchy table has been rebuilt.
     517 Nov 12 18:25  Warning     NTDS General           2147486689 The security of this directory server can be significantly enhanced by configuring the server to enforce ...
     516 Nov 12 06:40  Information NTDS General           1073744851 Internal event: Online Defragment Start succeeded....
     515 Nov 12 06:40  Information NTDS General           1073744857 Internal event: Online Defragment Stop invoked but defrag was not running.
     514 Nov 12 06:40  Information NTDS ISAM                     701 NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freei...
     513 Nov 12 06:40  Information NTDS ISAM                     700 NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
     512 Nov 12 06:25  Information NTDS General           1073742986 Internal event: The Address Book hierarchy table has been rebuilt.
     511 Nov 11 18:40  Information NTDS General           1073744851 Internal event: Online Defragment Start succeeded....
     510 Nov 11 18:40  Information NTDS General           1073744857 Internal event: Online Defragment Stop invoked but defrag was not running.
     509 Nov 11 18:40  Information NTDS ISAM                     701 NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freei...
     508 Nov 11 18:40  Information NTDS ISAM                     700 NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.



TimeCreated             Id LevelDisplayName Message
-----------             -- ---------------- -------
11/13/2025 6:40:45 AM 3027 Information      Internal event: Online Defragment Start succeeded. ...
11/13/2025 6:40:45 AM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/13/2025 6:40:45 AM  701 Information      NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass sta...
11/13/2025 6:40:45 AM  700 Information      NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
11/13/2025 6:25:45 AM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/12/2025 6:40:46 PM 3027 Information      Internal event: Online Defragment Start succeeded. ...
11/12/2025 6:40:46 PM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/12/2025 6:40:46 PM  701 Information      NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass sta...
11/12/2025 6:40:46 PM  700 Information      NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
11/12/2025 6:25:46 PM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/12/2025 6:25:46 PM 3041 Warning          The security of this directory server can be significantly enhanced by configuring the server to enforce  validation of Channel Binding Token...
11/12/2025 6:40:47 AM 3027 Information      Internal event: Online Defragment Start succeeded. ...
11/12/2025 6:40:47 AM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/12/2025 6:40:47 AM  701 Information      NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass sta...
11/12/2025 6:40:47 AM  700 Information      NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.
11/12/2025 6:25:47 AM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/11/2025 6:40:48 PM 3027 Information      Internal event: Online Defragment Start succeeded. ...
11/11/2025 6:40:48 PM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/11/2025 6:40:48 PM  701 Information      NTDS (836,D,0) NTDSA: Online defragmentation has completed a full pass on database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass sta...
11/11/2025 6:40:48 PM  700 Information      NTDS (836,D,0) NTDSA: Online defragmentation is beginning a full pass on database 'C:\Windows\NTDS\ntds.dit'.

```
<img width="958" height="483" alt="image" src="https://github.com/user-attachments/assets/c034e40f-ad30-40bb-b931-b5259edf6a3e" />



- [ ]  service3
``` sh
nano services3.ps1
```
``` powershell
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```

- [ ]  service4
``` sh
.\services4.ps1
```
``` powershell
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```
<img width="704" height="53" alt="image" src="https://github.com/user-attachments/assets/8b454bd1-f7e1-4fb5-a655-2b3e2c05c446" />
