# ============================================================
# Script : trust-basic-check.ps1
# Objectif : Vérifier la connectivité et valider un REALM TRUST (MIT)
# Domaine local  : DC300150416-00.local
# Domaine distant : DC300146676-00.local
# Type de Trust : REALM / TWO-WAY (Kerberos)
# Auteur : Hachem Souyadi (300150416)
#
# NOTE IMPORTANTE :
# Un REALM TRUST ne permet PAS :
#   - Get-ADDomain -Server
#   - Get-ADUser -Server
#   - New-PSDrive ActiveDirectory sur domaine distant
#
# Ce comportement est NORMAL pour un MIT/Realm Trust.
# ============================================================

param(
    [string]$RemoteDomainFqdn = "DC300146676-00.local",
    [string]$RemoteServer = "DC300146676"   # Nom NetBIOS
)

Write-Host "=== 1) Vérification de la connectivité (Ping) ===" -ForegroundColor Cyan
Test-Connection -ComputerName $RemoteDomainFqdn -Count 2

Write-Host "`n=== 2) Vérification DNS ===" -ForegroundColor Cyan
nslookup $RemoteDomainFqdn

# Demande des identifiants
Write-Host "`n=== 3) Authentification sur le domaine distant (REALM) ===" -ForegroundColor Cyan
$credRemote = Get-Credential -Message "Entrez un compte Admin du domaine $RemoteDomainFqdn"

# Tentative d’interroger AD distant (échouera → normal)
Write-Host "`n=== 4) Tentative d'interroger AD du domaine distant ===" -ForegroundColor Yellow
try {
    Get-ADDomain -Server $RemoteDomainFqdn -Credential $credRemote
}
catch {
    Write-Host "⚠️ Impossible d'interroger AD distant. NORMAL en REALM TRUST (MIT Kerberos)." -ForegroundColor Red
}

# Vérification du Trust
Write-Host "`n=== 5) Vérification du Trust existant ===" -ForegroundColor Cyan
Get-ADTrust -Filter *

Write-Host "`n=== Fin du script ===" -ForegroundColor Green
