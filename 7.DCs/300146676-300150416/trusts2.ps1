###################################################
# Script : trusts2.ps1
# Rôle : Vérifier le trust REALM et tester l'accès
# Relation : Domaine B (Aymen) → Domaine A (Hachem)
# Auteur : Hachem Souyadi
###################################################

Write-Host "============================================"
Write-Host "     VALIDATION DU REALM TRUST (MIT)"
Write-Host "============================================" -ForegroundColor Cyan

# Variables
$RemoteDC = "DC300150416-00.local"     # Domaine de Hachem
$RemoteServer = "DC300150416"          # Nom du DC de Hachem

# Credentials
$credA = Get-Credential -Message "Entrez un compte administrateur du domaine $RemoteDC"

# 1. Vérification réseau
Write-Host "`n=== 1. Vérification de la connectivité réseau ===" -ForegroundColor Yellow
Test-Connection -ComputerName $RemoteServer -Count 2

# 2. Test DNS
Write-Host "`n=== 2. Vérification DNS ===" -ForegroundColor Yellow
nslookup $RemoteServer

# 3. Domaine local
Write-Host "`n=== 3. Informations du domaine local ===" -ForegroundColor Cyan
Get-ADDomain

# 4. Infos domaine distant (Realm trust ne supporte pas ADWS)
Write-Host "`n=== 4. Informations du domaine distant (peut échouer : normal en REALM TRUST) ===" -ForegroundColor Green
try {
    Get-ADDomain -Server $RemoteDC -Credential $credA
}
catch {
    Write-Host "⚠️ Impossible d'interroger le domaine distant via ADWS. C'est NORMAL pour un REALM (MIT) Trust." -ForegroundColor Red
}

# 5. Liste des utilisateurs du domaine distant
Write-Host "`n=== 5. Liste des utilisateurs du domaine distant (peut échouer : normal en REALM TRUST) ===" -ForegroundColor Green
try {
    Get-ADUser -Filter * -Server $RemoteDC -Credential $credA |
        Select SamAccountName, DistinguishedName
}
catch {
    Write-Host "⚠️ Accès LDAP refusé. Les REALM Trust ne supportent PAS Get-ADUser." -ForegroundColor Red
}

# 6. Vérification du Trust
Write-Host "`n=== 6. Vérification de la relation Trust ===" -ForegroundColor Yellow
Get-ADTrust -Filter *

Write-Host "`n============================================"
Write-Host "     VALIDATION TERMINEE"
Write-Host "============================================" -ForegroundColor Cyan
