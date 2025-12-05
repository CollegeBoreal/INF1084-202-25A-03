# services2.ps1
# Afficher les 20 derniers événements du service AD
Get-EventLog -LogName "Directory Service" -Newest 20

# Afficher les 20 derniers événements système liés à Netlogon
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}

# Afficher les événements via le journal moderne (v2)
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
