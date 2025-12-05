<# =========================================================
 Script Trust – Domaine du ouail (300148094)
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local (ouail) ===
$LocalDomainDnsName  = "DC300148094-00.local"
$LocalDomainNetbios  = "DC300148094-00"

# === Domaine distant (mohib : 300152260) ===
$RemoteDomainDnsName = "DC300152260-00.local"
$RemoteDomainNetbios = "DC300152260-00"
$RemoteDC            = "DC300152260"

Write-Host "=== 1. Vérification DNS ==="
Resolve-DnsName $RemoteDomainDnsName
Resolve-DnsName $RemoteDC

Write-Host "=== 2. Test de connectivité ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "=== 3. Demande des identifiants Remote AD ==="
$credRemote = Get-Credential -Message "Entrez le compte admin de DC300152260-00.local"

Write-Host "=== 4. Interroger le domaine distant ==="
Get-ADDomain -Server $RemoteDomainDnsName -Credential $credRemote
Get-ADUser -Filter * -Server $RemoteDomainDnsName -Credential $credRemote |
    Select-Object -First 10 Name, SamAccountName

Write-Host "=== 5. Créer un PSDrive vers AD distant ==="
New-PSDrive -Name ADREMOTE `
  -PSProvider ActiveDirectory `
  -Root "DC=DC300152260-00,DC=local" `
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
