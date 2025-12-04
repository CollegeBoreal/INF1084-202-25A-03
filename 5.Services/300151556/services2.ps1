# services2.ps1
# Objectif : Afficher les événements récents liés à Active Directory.

Write-Host "=== Derniers événements Directory Service ===" -ForegroundColor Cyan

# 1️⃣ Afficher les 20 derniers événements du service Directory Service
Get-EventLog -LogName "Directory Service" -Newest 20 | 
    Format-Table TimeCreated, EntryType, Source, EventID, Message -AutoSize


Write-Host "`n=== Derniers événements Netlogon (System) ===" -ForegroundColor Cyan

# 2️⃣ Afficher les 20 derniers logs système liés à Netlogon
Get-EventLog -LogName "System" -Newest 50 |
    Where-Object {$_.Source -eq "Netlogon"} |
    Select-Object -First 20 |
    Format-Table TimeCreated, EventID, EntryType, Message -AutoSize


Write-Host "`n=== Journaux modernes (Event Viewer v2) ===" -ForegroundColor Cyan

# 3️⃣ Afficher les 20 derniers événements Directory Service via Event Viewer moderne
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -Wrap -AutoSize
