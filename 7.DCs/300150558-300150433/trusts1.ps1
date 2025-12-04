<# =========================================================
Zakaria (DC300150433)
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local ===
$LocalDomainDnsName  = "DC300150433-00.local"
$LocalDomainNetbios  = "DC300150433-00"

# === Domaine distant de amira ===
$RemoteDomainDnsName = "DC300150558-00.local"
$RemoteDomainNetbios = "DC300150558-00"
$RemoteDC            = "DC300150558"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $RemoteDomainDnsName
Resolve-DnsName $RemoteDC

Write-Host "=== 2. Test de connectivité ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "=== 3. Demande des identifiants AD2 ==="
$credAD2 = Get-Credential -Message "Entrez le compte admin de DC300150558-00.local"

Write-Host "=== 4. Interroger AD2 ==="
Get-ADDomain -Server $RemoteDomainDnsName -Credential $credAD2
Get-ADUser -Filter * -Server $RemoteDomainDnsName -Credential $credAD2 |
    Select-Object -First 10 Name, SamAccountName

Write-Host "=== 5. Créer un PSDrive pour AD2 ==="
New-PSDrive -Name AD2 `
  -PSProvider ActiveDirectory `
  -Root "DC=DC300150558-00,DC=local" `
  -Server $RemoteDomainDnsName `
  -Credential $credAD2

Set-Location AD2:\

Write-Host " - Contenu racine AD2 :"
Get-ChildItem

Set-Location C:\

Write-Host "=== 6. Création du trust ==="
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
