<# =========================================================
 Script complet corrige pour Hanane (DC300147816)
 Trust bidirectionnel avec Rabia (DC300151469-00)
========================================================= #>

Import-Module ActiveDirectory

# === Domaine local de Hanane ===
$LocalDomainDnsName  = "DC300147816.local"
$LocalDomainNetbios  = "DC300147816VM"

# === Domaine distant de Rabia ===
$RemoteDomainDnsName = "DC300151469-00.local"
$RemoteDomainNetbios = "DC300151469-00"

# IP du DC de Rabia (fonctionne chez toi)
$RemoteDC = "10.7.236.221"

Write-Host "=== 1. Verification DNS ==="
try {
    Resolve-DnsName $RemoteDomainDnsName -ErrorAction Stop
} catch {
    Write-Host "DNS resolution failed for $RemoteDomainDnsName. Using IP instead." -ForegroundColor Yellow
}

Write-Host "`n=== 2. Test de connectivite ==="
Test-Connection -ComputerName $RemoteDC -Count 2

Write-Host "`n=== 3. Identifiants du domaine distant (Rabia) ==="
$credRemote = Get-Credential -Message "Identifiants administrateur du domaine DC300151469-00.local"

Write-Host "`n=== 4. Creation du trust bidirectionnel ==="
netdom trust DC300147816.local `
    /Domain:DC300151469-00.local `
    /UserD:DC300151469-00\Administrator `
    /PasswordD:* `
    /UserO:DC300147816VM\Administrator `
    /PasswordO:* `
    /Twoway /Add







Write-Host "`n=== 5. Verification du trust ==="
Get-ADTrust -Filter *

netdom trust $RemoteDomainDnsName `
    /Domain:$LocalDomainDnsName `
    /verify

Write-Host "`n=== Script termine pour Hanane ==="


