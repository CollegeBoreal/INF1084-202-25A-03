<# =========================================================
 Script Trust – Domaine de mohib (300152260)
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local (mohib) ===
$LocalDomainDnsName  = "DC300152260-00.local"
$LocalDomainNetbios  = "DC300152260-00"

# === Domaine distant (Binôme : 300148094) ===
$RemoteDomainDnsName = "DC300148094-00.local"
$RemoteDomainNetbios = "DC300148094-00"
$RemoteDC            = "DC300148094"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $RemoteDomainDnsName
Resolve-DnsName $RemoteDC

Write-Host "=== 2. Test de connectivité ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "=== 3. Demande des identifiants Remote AD ==="
$credRemote = Get-Credential -Message "Entrez le compte admin de DC300148094-00.local"

Write-Host "=== 4. Interroger le domaine distant ==="
Get-ADDomain -Server $RemoteDomainDnsName -Credential $credRemote
Get-ADUser -Filter * -Server $RemoteDomainDnsName -Credential $credRemote |
    Select-Object -First 10 Name, SamAccountName

Write-Host "=== 5. Créer un PSDrive vers AD distant ==="
New-PSDrive -Name ADREMOTE `
  -PSProvider ActiveDirectory `
  -Root "DC=DC300148094-00,DC=local" `
  -Server $RemoteDomainDnsName `
  -Credential $credRemote

Set-Location ADREMOTE:\

Write-Host " - Contenu racine du domaine distant :"
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
