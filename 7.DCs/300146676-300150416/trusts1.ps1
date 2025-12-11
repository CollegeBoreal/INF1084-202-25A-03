# trusts1.ps1
# Script de création du trust entre DC300150416-00.local et DC300146676-00.local
# Auteur : Hachem Souyadi (INF1084)
# Coéquipier : Harkati Aymen

Write-Host "============================================"
Write-Host "   CREATION DU FOREST TRUST"
Write-Host "============================================"

# 1. Authentification manuelle pour le domaine distant
Write-Host "`n=== 1. Authentification vers le domaine distant ==="
$cred = Get-Credential

# 2. Vérification DNS + Ping avant la création
Write-Host "`n=== 2. Vérification de la connectivité ==="
Test-Connection -ComputerName "DC300146676-00.local" -Count 2

Write-Host "`n=== 2b. Test DNS vers le domaine distant ==="
nslookup "DC300146676-00.local"

# 3. Lancement de la création du trust
Write-Host "`n=== 3. Création du Forest Trust ==="

netdom trust DC300150416-00.local /Domain:DC300146676.local /UserD:administrator /PasswordD:* /Add /Realm /TwoWay

# 4.Verification de la création du trust
Write-Host "`n=== 4. Verification du Forest Trust ==="

Get-ADTrust -filter *


Write-Host "`n============================================"
Write-Host "   CREATION DU TRUST TERMINEE"
Write-Host "============================================"
