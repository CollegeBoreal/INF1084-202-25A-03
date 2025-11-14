# 1) 20 derniers événements "Directory Service" (NTDS) via EventLog classique
Get-EventLog -LogName "Directory Service" -Newest 20

# 2) 20 derniers événements du journal système, filtrés sur la Source Netlogon
Get-EventLog -LogName "System" -Newest 20 | Where-Object { $_.Source -eq "Netlogon" }

# 3) Journal "moderne" (Get-WinEvent) + format tableau lisible
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
  Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
