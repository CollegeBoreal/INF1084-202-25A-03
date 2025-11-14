# ============================================
# Fichier : bootstrap.ps1
# Auteur : Rabia Bouhali
# ID:300151469
# Description : Configuration du domaine et gestion des utilisateurs AD
# ============================================

$studentNumber = 300151469
$studentInstance = 40

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

Import-Module ActiveDirectory

Write-Host "Verification du domaine et du controleur de domaine..." -ForegroundColor Cyan
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

Disable-ADAccount -Identity "alice.dupont" -Credential $cred
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
    Write-Host "OU 'Students' cree avec succes." -ForegroundColor Green
} else {
    Write-Host "OU 'Students' deja existante." -ForegroundColor Yellow
}

Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName

Write-Host "Script termine avec succes." -ForegroundColor Green
