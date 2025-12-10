Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Users\Administrator\Developer\INF1084-202-25A-03\5.Services\300153476\ADLogs.csv" -NoTypeInformation
