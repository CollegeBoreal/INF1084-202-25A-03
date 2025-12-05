# utilisateurs2.ps1
. ./bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== Creation utilisateur ==="

$user = Get-ADUser -Filter "SamAccountName -eq 'alice.dupont'" -ErrorAction SilentlyContinue

if (-not $user) {
    New-ADUser -Name "Alice Dupont" `
               -GivenName "Alice" `
               -Surname "Dupont" `
               -SamAccountName "alice.dupont" `
               -UserPrincipalName "alice.dupont@$domainName" `
               -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
               -Enabled $true `
               -Path "CN=Users,DC=$netbiosName,DC=local" `
               -Credential $cred
    Write-Host "User created"
} else {
    Write-Host "User already exists"
}

Write-Host "=== Modification ==="
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@example.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

Write-Host "=== Disable user ==="
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

Write-Host "=== Enable user ==="
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

Write-Host "=== END utilisateurs2.ps1 ==="

