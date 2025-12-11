# services2.ps1
# Afficher les événements liés à Active Directory

# 20 derniers événements du Directory Service
Get-EventLog -LogName "Directory Service" -Newest 20

# Logs système liés à Netlogon
Get-EventLog -LogName "System" -Newest 20 | Where-Object { $_.Source -eq "Netlogon" }

# Logs modernes (Event Viewer v2)
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -Wrap
