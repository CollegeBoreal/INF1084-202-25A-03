- [ ]  service1
``` sh
notepad services1.ps1
```
``` sh
.\services1.ps1
```
``` powershell

=== Liste des services Active Directory ===

Name      Status DisplayName
----      ------ -----------
NTDS     Running Active Directory Domain Services
ADWS     Running Active Directory Web Services
DFSR     Running DFS Replication
IsmServ  Running Intersite Messaging
Kdc      Running Kerberos Key Distribution Center
Netlogon Running Netlogon



=== Ã‰tat des services AD principaux ===

Name      Status DisplayName
----      ------ -----------
ADWS     Running Active Directory Web Services
DFSR     Running DFS Replication
IsmServ  Running Intersite Messaging
KDC      Running Kerberos Key Distribution Center
Netlogon Running Netlogon
NTDS     Running Active Directory Domain Services

<img width="1184" height="524" alt="image" src="https://github.com/user-attachments/assets/532b2cdd-9301-446c-b236-66cd385da6d4" />

```

- [ ]  service2

``` sh
notepad services2.ps1
```
``` sh
.\services2.ps1
```
``` powershell

=== Derniers Ã©vÃ©nements Directory Service ===

TimeCreated   EntryType Source       EventID Message
-----------   --------- ------       ------- -------
            Information NTDS General    3027 Internal event: Online Defragment Start succeeded....
            Information NTDS General    3033 Internal event: Online Defragment Stop invoked but defrag was not running.
            Information NTDS ISAM        701 NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass ...
            Information NTDS ISAM        700 NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass o...
            Information NTDS General    1162 Internal event: The Address Book hierarchy table has been rebuilt.
                Warning NTDS General    3041 The security of this directory server can be significantly enhanced by ...
            Information NTDS General    3027 Internal event: Online Defragment Start succeeded....
            Information NTDS General    3033 Internal event: Online Defragment Stop invoked but defrag was not running.
            Information NTDS ISAM        701 NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass ...
            Information NTDS ISAM        700 NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass o...
            Information NTDS General    1162 Internal event: The Address Book hierarchy table has been rebuilt.
            Information NTDS General    3027 Internal event: Online Defragment Start succeeded....
            Information NTDS General    3033 Internal event: Online Defragment Stop invoked but defrag was not running.
            Information NTDS ISAM        701 NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass ...
            Information NTDS ISAM        700 NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass o...
            Information NTDS General    1162 Internal event: The Address Book hierarchy table has been rebuilt.
                Warning NTDS General    3041 The security of this directory server can be significantly enhanced by ...
            Information NTDS General    3027 Internal event: Online Defragment Start succeeded....
            Information NTDS General    3033 Internal event: Online Defragment Stop invoked but defrag was not running.
            Information NTDS ISAM        701 NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass ...



=== Derniers Ã©vÃ©nements Netlogon (System) ===

=== Journaux modernes (Event Viewer v2) ===

TimeCreated             Id LevelDisplayName Message
-----------             -- ---------------- -------
11/27/2025 6:56:44 PM 3027 Information      Internal event: Online Defragment Start succeeded.

                                            Duration in seconds:3600

11/27/2025 6:56:44 PM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/27/2025 6:56:44 PM  701 Information      NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass started on
                                            11/27/2025 and ran for a total of 0 seconds, requiring 1 invocations over
                                            1 days. Since the database was created it has been fully defragmented 16
                                            times.
11/27/2025 6:56:44 PM  700 Information      NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit'.
11/27/2025 6:41:44 PM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/27/2025 6:41:44 PM 3041 Warning          The security of this directory server can be significantly enhanced by
                                            configuring the server to enforce  validation of Channel Binding Tokens
                                            received in LDAP bind requests sent over LDAPS connections. Even if  no
                                            clients are issuing LDAP bind requests over LDAPS, configuring the server
                                            to validate Channel Binding  Tokens will improve the security of this
                                            server.

                                            For more details and information on how to make this configuration change
                                            to the server, please see https://go.microsoft.com/fwlink/?linkid=2102405.
11/27/2025 6:56:45 AM 3027 Information      Internal event: Online Defragment Start succeeded.

                                            Duration in seconds:3600

11/27/2025 6:56:45 AM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/27/2025 6:56:45 AM  701 Information      NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass started on
                                            11/27/2025 and ran for a total of 0 seconds, requiring 1 invocations over
                                            1 days. Since the database was created it has been fully defragmented 15
                                            times.
11/27/2025 6:56:45 AM  700 Information      NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit'.
11/27/2025 6:41:45 AM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/26/2025 6:56:46 PM 3027 Information      Internal event: Online Defragment Start succeeded.

                                            Duration in seconds:3600

11/26/2025 6:56:46 PM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/26/2025 6:56:46 PM  701 Information      NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass started on
                                            11/26/2025 and ran for a total of 0 seconds, requiring 1 invocations over
                                            1 days. Since the database was created it has been fully defragmented 14
                                            times.
11/26/2025 6:56:46 PM  700 Information      NTDS (828,D,0) NTDSA: Online defragmentation is beginning a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit'.
11/26/2025 6:41:46 PM 1162 Information      Internal event: The Address Book hierarchy table has been rebuilt.
11/26/2025 6:41:46 PM 3041 Warning          The security of this directory server can be significantly enhanced by
                                            configuring the server to enforce  validation of Channel Binding Tokens
                                            received in LDAP bind requests sent over LDAPS connections. Even if  no
                                            clients are issuing LDAP bind requests over LDAPS, configuring the server
                                            to validate Channel Binding  Tokens will improve the security of this
                                            server.

                                            For more details and information on how to make this configuration change
                                            to the server, please see https://go.microsoft.com/fwlink/?linkid=2102405.
11/26/2025 6:56:47 AM 3027 Information      Internal event: Online Defragment Start succeeded.

                                            Duration in seconds:3600

11/26/2025 6:56:47 AM 3033 Information      Internal event: Online Defragment Stop invoked but defrag was not running.
11/26/2025 6:56:47 AM  701 Information      NTDS (828,D,0) NTDSA: Online defragmentation has completed a full pass on
                                            database 'C:\Windows\NTDS\ntds.dit', freeing 0 pages. This pass started on
                                            11/26/2025 and ran for a total of 0 seconds, requiring 1 invocations over
                                            1 days. Since the database was created it has been fully defragmented 13
                                            times.

<img width="1885" height="946" alt="image" src="https://github.com/user-attachments/assets/14cea1ef-e7b6-4029-94ca-da3b94ec9e03" />

<img width="1887" height="994" alt="image" src="https://github.com/user-attachments/assets/9d1c116d-03a9-452f-97d6-0a9d24c10176" />




```

- [ ]  service3


``` sh
notepad services3.ps1
```

``` sh
.\services3.ps1
```
``` powershell

=== Exportation des journaux Directory Service ===
Export terminÃ© avec succÃ¨s !
Fichier crÃ©Ã© : C:\Logs\ADLogs.csv

<img width="1052" height="81" alt="image" src="https://github.com/user-attachments/assets/67725c67-0e7e-4277-bca6-9c889b97f9de" />

```


- [ ]  service4
``` sh
notepad services3.ps1
```
```
.\services4.ps1
```

``` powershell
=== Etat actuel du service DFSR ===

Name  Status
----  ------
DFSR Running



>>> ArrÃªt du service DFSR ...

=== Etat aprÃ¨s l'arrÃªt ===

Name  Status
----  ------
DFSR Stopped



>>> RedÃ©marrage du service DFSR ...

=== Ã‰tat final du service DFSR ===

Name  Status
----  ------
DFSR Running



OpÃ©ration terminÃ©e avec succÃ¨s !

<img width="886" height="703" alt="image" src="https://github.com/user-attachments/assets/4f7c288a-8080-480d-bfc6-d3f041ce5367" />



```

