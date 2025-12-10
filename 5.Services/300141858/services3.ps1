# services3.ps1
# Exporter les événements AD dans un CSV

Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
    Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
