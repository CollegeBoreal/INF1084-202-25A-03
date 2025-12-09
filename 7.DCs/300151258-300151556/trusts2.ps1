<# =========================================================
 Script Trust2.ps1 – Domaine LOCAL : 300151258-00.local
 Auteur : C'est hakim 300151258

 Objectif : Créer un trust bidirectionnel vers 300151556
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local (binôme) ===
$LocalDomainDnsName  = "DC300151258-00.local"
$LocalDomainNetbios  = "DC300151258-00"

# === Domaine distant (toi) ===
$RemoteDomainDnsName = "DC300151556-00.local"
$RemoteDomainNetbios = "DC300151556-00"
$RemoteDC            = "DC300151556"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $RemoteDomainDnsName
Resolve-DnsName $RemoteDC

Write-Host "=== 2. Test de connectivité (Ping) ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "=== 3. Demande des identifiants du domaine 300151556 ==="
$credRemote = Get-Credential -Message "Entrez un compte admin de DC300151556-00.local"

Write-Host "=== 4. Interroger Active Directory distant ==="
Get-ADDomain -Server $RemoteDomainDnsName -Credential $credRemote
Get-ADUser -Filter * -Server $RemoteDomainDnsName -Credential $credRemote |
    Select-Object -First 10 Name,SamAccountName

Write-Host "=== 5. Créer un PSDrive vers AD de ton binôme ==="
New-PSDrive -Name AD1 `
  -PSProvider ActiveDirectory `
  -Root "DC=DC300151556-00,DC=local" `
  -Server $RemoteDomainDnsName `
  -Credential $credRemote

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

Write-Host "=== Script terminé (trust2.ps1) ==="