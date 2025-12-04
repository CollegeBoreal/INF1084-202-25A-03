## Nom de la GPO
$GPOName = "MapSharedFolder"

# === 1. Créer l'OU Students SI ELLE N'EXISTE PAS ===
$OUPath = "OU=Students,DC=DC300148094-00,DC=local"

if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=DC300148094-00,DC=local"
}

# === 2. Créer la GPO ===
New-GPO -Name $GPOName -ErrorAction SilentlyContinue

# === 3. Lier la GPO à l'OU ===

Remove-GPLink -Name $GPOName -Target $OUPath -Confirm:$false -ErrorAction SilentlyContinue
New-GPLink -Name $GPOName -Target $OUPath

# === 4. Préférences pour mapper le lecteur réseau ===
$DriveLetter = "Z:"
$SharePath = "\\DC300148094-00\SharedResources"

# === 5. Créer le script logon ===
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"

if (-not (Test-Path $ScriptFolder)) { New-Item -ItemType Directory -Path $ScriptFolder }

$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent

# === 6. Lier le script à la GPO ===
Set-GPRegistryValue -Name $GPOName `
                    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
                    -ValueName "LogonScript" `
                    -Type String `
                    -Value $ScriptPath

