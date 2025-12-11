Import-Module ActiveDirectory
Import-Module GroupPolicy

$GPOName = "MapSharedFolder"
$OU = "OU=Students,DC=DC300151556-00,DC=local"
$DriveLetter = "Z:"
$SharePath = "\\$env:COMPUTERNAME\SharedResources"
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

Write-Host "Création/Lien GPO MapSharedFolder..." -ForegroundColor Cyan

if (-not (Get-GPO -Name $GPOName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $GPOName | Out-Null
    Write-Host "GPO créée : $GPOName" -ForegroundColor Green
}

New-GPLink -Name $GPOName -Target $OU -ErrorAction SilentlyContinue
Write-Host "GPO liée à l'OU Students" -ForegroundColor Green

if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent
Write-Host "Script logon créé : $ScriptPath" -ForegroundColor Green

Set-GPRegistryValue -Name $GPOName `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
-ValueName "LogonScript" `
-Type String `
-Value $ScriptPath

gpupdate /force | Out-Null
Write-Host "🎯 Terminé : Le lecteur Z: sera mappé au prochain logon !" -ForegroundColor Yellow
