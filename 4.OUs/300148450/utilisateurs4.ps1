<# =========================================================
 Script utilisateurs4.ps1 – Création OU + Déplacement utilisateur
========================================================= #>

. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== Check or create OU Students ==="

# Vérifier si l'OU existe
$ou = Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -ErrorAction SilentlyContinue

if (-not $ou) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
    Write-Host "OU Students created"
} else {
    Write-Host "OU Students already exists"
}

Write-Host "=== Move user to OU Students ==="

$source = "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local"
$target = "OU=Students,DC=$netbiosName,DC=local"

try {
    Move-ADObject -Identity $source -TargetPath $target -Credential $cred
} catch {
    Write-Host "User moved if existed"
}

Write-Host "=== Check new DN ==="
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName

