
<# 
Script : Create-And-Verify-Forest-Trust.ps1
Usage : Exécuter ce script sur chaque DC (dc01.ad1.local et dc01.ad2.local).
But   : Créer un trust bidirectionnel (transitif ou non) entre deux forêts AD et le vérifier.
#>

param(
    [string]$ThisForestFQDN = "DC300151825-00.local",       # La forêt locale (modifier côté AD2)
    [string]$ThisDC         = "DC300153476.local",  # DC de la forêt locale
    [string]$PeerForestFQDN = "ad2.local",       # Forêt distante
    [string]$PeerDC         = "dc01.ad2.local",  # DC de la forêt distante
    [ValidateSet("Forest","External","Shortcut","Realm")]
    [string]$TrustType      = "Forest",          # Type de trust (projet : Forest)
    [ValidateSet("Transitive","NonTransitive")]
    [string]$Transitivity   = "Transitive",      # Transitivité (choix projet)
    [ValidateSet("Bidirectional","Inbound","Outbound")]
    [string]$Direction      = "Bidirectional",   # Direction du trust
    [ValidateSet("Forest","Selective")]
    [string]$Authentication = "Forest"           # Auth (Forest-wide ou Selective)
)

Write-Host "=== Création du trust entre $ThisForestFQDN et $PeerForestFQDN ===" -ForegroundColor Cyan

# 1) Prérequis – demander les identifiants ADMIN de la forêt distante
$credPeer = Get-Credential -Message "Entrez un compte admin de $PeerForestFQDN"

# 2) Vérifier la connectivité réseau et DNS
Write-Host "`n[Check] Ping/DC reachability..." -ForegroundColor Yellow
Test-Connection -ComputerName $PeerDC -Count 2 -Quiet | ForEach-Object {
    if (-not $_) { throw "Le DC distant $PeerDC n'est pas joignable. Vérifiez réseau/DNS." }
}
Write-Host "[OK] $PeerDC joignable."

Write-Host "`n[Check] Résolution DNS..." -ForegroundColor Yellow
try {
    $a = Resolve-DnsName $PeerDC -ErrorAction Stop
    Write-Host "[OK] DNS résout $PeerDC -> $($a.IPAddress)"
} catch {
    throw "DNS ne résout pas $PeerDC. Ajoutez une zone de transfert conditionnelle ou un redirecteur."
}

# 3) Vérifier les ports essentiels (Kerberos, LDAP, RPC, SMB)
Write-Host "`n[Check] Ports requis (88, 389, 445, 135)..." -ForegroundColor Yellow
$ports = 88,389,445,135
foreach ($p in $ports) {
    $res = Test-NetConnection -ComputerName $PeerDC -Port $p
    if (-not $res.TcpTestSucceeded) { throw "Port $p vers $PeerDC fermé. Ouvrez sur firewall." }
}
Write-Host "[OK] Ports ouverts."

# 4) Vérifier l'accès à AD distant (interrogation)
Write-Host "`n[Check] Interroger domaine distant..." -ForegroundColor Yellow
Import-Module ActiveDirectory
$peerDomainInfo = Get-ADDomain -Server $PeerDC -Credential $credPeer
Write-Host "[OK] Domaine distant : $($peerDomainInfo.DNSRoot) / SID : $($peerDomainInfo.DomainSID.Value)"

# 5) Option : créer un PSDrive vers la forêt distante (navigation)
# Root doit être un DN valide et Server indique le DC cible.
$peerRootDN = ("DC=" + ($PeerForestFQDN -replace "\.",",DC="))
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root $peerRootDN -Server $PeerDC -Credential $credPeer -ErrorAction SilentlyContinue | Out-Null
Write-Host "[OK] PSDrive 'AD2:' monté sur $PeerForestFQDN (root=$peerRootDN)."
# Exemple de navigation :
# Set-Location AD2:\$peerRootDN
# Get-ChildItem

# 6) Créer le trust (côté THIS forest) – one shot
Write-Host "`n[Create] Trust côté $ThisForestFQDN -> $PeerForestFQDN ..." -ForegroundColor Yellow

# Mapper la transitivité vers le paramètre New-ADTrust
$transitiveBool = $true
if ($Transitivity -eq "NonTransitive") { $transitiveBool = $false }

# Important : pour un trust bidirectionnel forest, il est souvent nécessaire
# d'exécuter la commande de chaque côté OU d'utiliser NETDOM pour fixer les mots de passe du trust.
New-ADTrust -Name $PeerForestFQDN `
    -SourceForest $ThisForestFQDN `
    -TargetForest $PeerForestFQDN `
    -TrustType $TrustType `
    -Direction $Direction `
    -ForestTransitivelyTrusted:$transitiveBool `
    -SelectiveAuthentication:($Authentication -eq "Selective") `
    -Confirm:$false

Write-Host "[OK] New-ADTrust exécuté sur $ThisForestFQDN."

# 7) (Recommandé) Définir/Valider le mot de passe du trust via NETDOM
# Vous pouvez définir un mot de passe partagé pour le trust pour faciliter la création bidirectionnelle.
# Sur CHAQUE forêt, exécutez :
# netdom trust <PeerForestFQDN> /domain:<ThisForestFQDN> /Twoway /ForestTrust /passwordT:*
# (Mettra un mot de passe interactif ; ou utilisez /passwordT:<motdepasse> et /passwordO:<motdepasse>)
Write-Host "`n[Optional] Configurez le mot de passe du trust via NETDOM si nécessaire." -ForegroundColor Yellow

# 8) Vérification – inventaire du trust créé
Write-Host "`n[Verify] Inventaire des trusts (Get-ADTrust)..." -ForegroundColor Yellow
Get-ADTrust | Format-Table Name,Direction,TrustType,Source,Target

# 9) Validation via NETDOM (côté THIS et à exécuter aussi côté PEER)
Write-Host "`n[Verify] netdom trust /verify ..." -ForegroundColor Yellow
& netdom trust $PeerForestFQDN /domain:$ThisForestFQDN /verify


