<# =========================================================
amira
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local  ===
$LocalDomainDnsName  = "DC300150558-00.local"
$LocalDomainNetbios  = "DC300150558-00"

# === Domaine distant de zakaria ===
$RemoteDomainDnsName = "DC300150433-00.local"
$RemoteDomainNetbios = "DC300150433-00"
$RemoteDC            = "DC300150433"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $RemoteDomainDnsName
Resolve-DnsName $RemoteDC

Write-Host "=== 2. Test de connectivité ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "=== 3. Demande des identifiants AD1 ==="
$credAD1 = Get-Credential -Message "Entrez le compte admin de DC300150433-00.local"

Write-Host "=== 4. Interroger AD1 ==="
Get-ADDomain -Server $RemoteDomainDnsName -Credential $credAD1
Get-ADUser -Filter * -Server $RemoteDomainDnsName -Credential $credAD1 |
    Select-Object -First 10 Name, SamAccountName

Write-Host "=== 5. Créer un PSDrive vers AD1 ==="
New-PSDrive -Name AD1 `
  -PSProvider ActiveDirectory `
  -Root "DC=DC300150433-00,DC=local" `
  -Server $RemoteDomainDnsName `
  -Credential $credAD1

Set-Location AD1:\

Write-Host " - Contenu racine AD1 :"
Get-ChildItem

Set-Location C:\

Write-Host "=== 6. Création du trust BIDIRECTIONNEL ==="
netdom trust $RemoteDomainDnsName `
    /Domain:$LocalDomainDnsName `
    /UserD:$LocalDomainNetbios\Administrateur `
    /PasswordD:* `
    /UserO:$RemoteDomainNetbios\Administrateur `
    /PasswordO:* `
    /Twoway `
    /Transitive:Yes `
    /add

Write-Host "=== 7. Vérification du trust ==="
Get-ADTrust -Filter *
netdom trust $RemoteDomainDnsName /Domain:$LocalDomainDnsName /verify

Write-Host "=== Script terminé ==="