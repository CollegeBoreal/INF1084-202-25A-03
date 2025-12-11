🧩 Windows Services & Active Directory – Technical Documentation

Author : Amira Sadouni
ID Étudiant : 300150558

📘 Overview

This documentation provides a detailed technical analysis of Windows Services and their relationships with Active Directory Domain Services (AD DS). All observations and PowerShell scripts were executed on a Windows Server 2022 Domain Controller in a controlled lab environment.

1️⃣ Windows Services Fundamentals

Windows Services are background processes essential to the stability, authentication, and security of a Windows Server environment.

🔑 Key Characteristics

Run in the background without user interaction

Can start automatically, manually, or on demand

Essential for domain operations and authentication

Must be monitored for domain health

🗂️ Examples of System Services
Service Name	Display Name	Function
WinDefend	Windows Defender	Malware protection
W32Time	Windows Time	Time synchronization
Spooler	Print Spooler	Print job management
2️⃣ Active Directory Core Services and Dependencies

Active Directory relies on multiple services for authentication, replication, and directory availability.

Service	Process	Description
NTDS	Active Directory Domain Services	Core AD database and directory logic
ADWS	Active Directory Web Services	Enables AD management via PowerShell/RSAT
DFSR	Distributed File System Replication	Replicates SYSVOL & GPOs
KDC	Kerberos Key Distribution Center	Issues Kerberos authentication tickets
Netlogon	Netlogon Service	Domain logon, secure channel, DNS registration
IsmServ	Intersite Messaging Service	Supports multi-site replication
3️⃣ Functional Architecture

Flow Summary:

NTDS is the core engine of AD

KDC depends on NTDS to issue authentication tickets

Netlogon registers DCs via DNS and supports logon

DFSR replicates SYSVOL (GPOs & logon scripts)

ADWS enables remote management through PowerShell

IsmServ ensures replication across AD sites

4️⃣ PowerShell Operations
4.1 List AD-related services
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

4.2 Check service status
Get-Service -Name NTDS, ADWS, DFSR

4.3 Manage service lifecycle
Start-Service -Name Netlogon
Stop-Service -Name DFSR
Restart-Service -Name NTDS

4.4 Event Log Analysis
Get-EventLog -LogName "Directory Service" -Newest 20
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize

4.5 Export Logs
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation

5️⃣ Automation Scripts
📄 services1.ps1
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

Get-Service -Name NTDS, ADWS, DFSR

📄 services2.ps1
Get-EventLog -LogName "Directory Service" -Newest 20
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize

📄 services3.ps1
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation

📄 services4.ps1
Stop-Service -Name DFSR
(Get-Service -Name DFSR).Status
Start-Service -Name DFSR

6️⃣ Dependency Matrix
Service	Critical Dependency	Impact if Stopped
NTDS	Core	AD unavailable, GPOs unavailable
KDC	NTDS	Kerberos authentication failure
Netlogon	KDC	Logon & DNS registration failure
DFSR	NTDS	SYSVOL replication stops
ADWS	NTDS	PowerShell AD mgmt stops
IsmServ	DFSR	Intersite replication blocked
7️⃣ Administrative Best Practices

Always check service dependencies before stopping NTDS or DFSR

Use Restart-Service for safer maintenance

Monitor the “Directory Service” log regularly

Export logs for auditing & compliance

Ensure time synchronization for Kerberos integrity

8️⃣ Lab Objectives

This lab demonstrates how to:

✔ Enumerate AD-related services
✔ Analyze AD event logs
✔ Export diagnostic logs
✔ Manage service states programmatically
✔ Understand the interdependency of Windows core services

9️⃣ Environment

OS : Windows Server 2022

Tools : PowerShell 7, RSAT, Event Viewer

Role : Active Directory Domain Controller (Lab)

🔧 Git Version Control (used in this work)
git init
git add .
git commit -m "Windows & AD Services Lab – Initial commit"
git branch -M main
git remote add origin https://github.com/CollegeBoreal/INF1084-202-25A-03.git
git push -u origin main

👩‍💻 Author

Amira Sadouni
ID Étudiant : 300150558
Collège Boréal – INF1084

✅ Conclusion

This documentation provides a complete technical understanding of Windows Services and their relationship with Active Directory.
The PowerShell scripts included demonstrate practical operational control, mastery of service dependencies, and adherence to administrative best practices in a Windows Server AD environment.