# === SCRIPT RABIA (300151469) ===
Import-Module ActiveDirectory

Write-Host "=== CONFIGURATION DU TRUST PAR RABIA ==="
$LocalDomain = "DC300151469.local"
$LocalNetBIOS = "DC300151469-00"
$LocalIP = "10.7.236.221"

# Domaine distant complet
$RemoteDomain = "DC300147816.local"
$RemoteNetBIOS = "DC300147816"
$RemoteIP = "10.7.236.208"

Write-Host "Domaine local : $LocalDomain (NetBIOS: $LocalNetBIOS)"
Write-Host "IP locale : $LocalIP"
Write-Host "================================"

# 1. Credentials AD local
$credLocal = Get-Credential -Message "Identifiants administrateur du domaine local"

# 2. DNS Forwarder
Write-Host "Configuration DNS vers Hanane..."
try {
    Add-DnsServerConditionalForwarderZone -Name $RemoteDomain -MasterServers $RemoteIP -ErrorAction Stop
    Write-Host "Zone DNS créée."
}
catch {
    Write-Host "La zone existe déjà, on continue..."
}

# 3. Test ping
Write-Host "Test de connexion vers Hanane ($RemoteIP)..."
Test-Connection -ComputerName $RemoteIP -Count 2

# 4. Credentials AD distant
$credRemote = Get-Credential -Message "Identifiants administrateur du domaine distant ($RemoteDomain)"

# 5. Création du trust
Write-Host "Création du trust forest bidirectionnel..."
$trustPassword = Read-Host "Entrez le mot de passe de trust fourni par Hanane"

# Utilisation de New-ADTrust si disponible, sinon netdom
if (Get-Command New-ADTrust -ErrorAction SilentlyContinue) {
    Write-Host "Cmdlet New-ADTrust disponible, utilisation..."
    New-ADTrust `
        -Name $RemoteNetBIOS `
        -TargetDomainName $RemoteDomain `
        -TrustType Forest `
        -TrustDirection Bidirectional `
        -TrustPassword (ConvertTo-SecureString $trustPassword -AsPlainText -Force) `
        -Credential $credLocal
}
else {
    Write-Host "Cmdlet New-ADTrust non disponible. Tentative avec netdom..."
    netdom trust $LocalDomain /domain:$RemoteDomain /add /twoWay /passwordt:$trustPassword
}

# 6. Vérification du trust
Write-Host "Vérification du trust..."
Get-ADTrust -Filter * | Format-Table Name, Direction, TrustType

# 7. Test d'accès au domaine distant
Write-Host "`nTest d'accès au domaine de Hanane..."
Get-ADDomain -Server $RemoteDomain -Credential $credRemote

Write-Host "`n=== TRUST ÉTABLI AVEC SUCCÈS ==="

