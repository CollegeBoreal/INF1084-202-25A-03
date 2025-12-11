Import-Module ActiveDirectory
Import-Module GroupPolicy

Write-Host "=== Étape 2 : GPO de mapping du lecteur réseau ===" -ForegroundColor Cyan

# 0) Récupérer les infos du domaine
$domain      = Get-ADDomain
$domainName  = $domain.DNSRoot            # ex : DC300150558-00.local
$netbiosName = $domain.NetBIOSName        # ex : DC300150558-00
$domainDN    = $domain.DistinguishedName  # ex : DC=DC300150558-00,DC=local

# 1) S'assurer que l'OU Students existe
$ouStudents = Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)" -ErrorAction SilentlyContinue
if (-not $ouStudents) {
    New-ADOrganizationalUnit -Name "Students" -Path $domainDN | Out-Null
    $ouStudents = Get-ADOrganizationalUnit -LDAPFilter "(ou=Students)"
    Write-Host "[OK] OU Students créée : $($ouStudents.DistinguishedName)" -ForegroundColor Green
} else {
    Write-Host "[!] OU Students existe déjà : $($ouStudents.DistinguishedName)" -ForegroundColor Yellow
}

$ouDN = $ouStudents.DistinguishedName     # ex : OU=Students,DC=DC300150558-00,DC=local

# 2) Créer la GPO si elle n'existe pas
$GPOName    = "MapSharedFolder"
$DriveLetter = "Z:"
$SharePath   = "\\$netbiosName\SharedResources"

$gpo = Get-GPO -Name $GPOName -ErrorAction SilentlyContinue
if (-not $gpo) {
    $gpo = New-GPO -Name $GPOName
    Write-Host "[OK] GPO $GPOName créée." -ForegroundColor Green
} else {
    Write-Host "[!] GPO $GPOName existe déjà." -ForegroundColor Yellow
}

# 3) Lier la GPO à l'OU Students (sans -Enforced)
try {
    New-GPLink -Name $GPOName -Target $ouDN | Out-Null
    Write-Host "[OK] GPO $GPOName liée à $ouDN." -ForegroundColor Green
}
catch {
    Write-Host "[ERREUR] Échec du lien GPO vers $ouDN : $($_.Exception.Message)" -ForegroundColor Red
}

# 4) Créer un script de logon qui mappe le lecteur Z:
$ScriptFolder = "C:\Scripts"
if (-not (Test-Path $ScriptFolder)) {
    New-Item -ItemType Directory -Path $ScriptFolder | Out-Null
}

$ScriptPath = Join-Path $ScriptFolder "MapDrive-$($DriveLetter.TrimEnd(':')).bat"
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent -Encoding ASCII

Write-Host "[OK] Script de logon créé : $ScriptPath" -ForegroundColor Green

# 5) Enregistrer le script pour qu'il se lance via GPO (HKCU\Run)
Set-GPRegistryValue -Name $GPOName `
    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" `
    -ValueName "MapDrive$($DriveLetter.TrimEnd(':'))" `
    -Type String `
    -Value $ScriptPath

Write-Host "[OK] GPO $GPOName configurée pour mapper $DriveLetter vers $SharePath." -ForegroundColor Green

