Write-Host "=== Création des utilisateurs, groupe Students et partage SMB ===" -ForegroundColor Cyan

# Charger les variables depuis bootstrap.ps1 (si non déjà chargé)
# . .\bootstrap.ps1

$domainDN = "DC=$netbiosName,DC=local"

# --- 1) Créer le dossier partagé ---
$SharedFolder = "C:\SharedResources"

if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
    Write-Host "[OK] Dossier SharedResources créé." -ForegroundColor Green
} else {
    Write-Host "[!] Dossier SharedResources existe déjà." -ForegroundColor Yellow
}

# --- 2) Créer groupe Students ---
$GroupName = "Students"

if (-not (Get-ADGroup -Identity $GroupName -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Groupe Students pour accès RDP et partage"
    Write-Host "[OK] Groupe Students créé." -ForegroundColor Green
} else {
    Write-Host "[!] Groupe Students existe déjà." -ForegroundColor Yellow
}

# --- 3) Créer utilisateurs et les ajouter à l’OU Students ---
$Users = @("Etudiant1","Etudiant2")

foreach ($user in $Users) {
    if (-not (Get-ADUser -Identity $user -ErrorAction SilentlyContinue)) {
        New-ADUser -Name $user `
            -SamAccountName $user `
            -UserPrincipalName "$user@$domainName" `
            -Path "OU=Students,$domainDN" `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true

        Write-Host "[OK] Utilisateur $user créé." -ForegroundColor Green
    } else {
        Write-Host "[!] Utilisateur $user existe déjà." -ForegroundColor Yellow
    }

    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

# --- 4) Permissions NTFS au groupe ---
$acl = Get-Acl $SharedFolder
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("$netbiosName\$GroupName","FullControl","ContainerInherit,ObjectInherit","None","Allow")
$acl.SetAccessRule($rule)
Set-Acl -Path $SharedFolder -AclObject $acl
Write-Host "[OK] Permissions NTFS appliquées." -ForegroundColor Green

# --- 5) Créer le partage SMB ---
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess "$netbiosName\$GroupName" | Out-Null
    Write-Host "[OK] Partage SMB créé : \\$netbiosName\SharedResources" -ForegroundColor Green
} else {
    Write-Host "[!] Partage SMB existe déjà." -ForegroundColor Yellow
}

