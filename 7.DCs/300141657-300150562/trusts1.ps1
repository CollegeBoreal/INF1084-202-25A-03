<# =========================================================
Leandre (DC-300141657-00)
Résumé des commandes exécutées
========================================================= #>

Write-Host "=== 1. Vérification DNS ==="
Ping isako29.store
# Résultat: 4 paquets envoyés, 4 reçus, 0% perte

Write-Host "=== 2. Vérifier le module ActiveDirectory ==="
Get-Module -ListAvailable ActiveDirectory
# Résultat: Module version 1.0.1.0

Write-Host "=== 3. Résoudre les domaines ==="
Resolve-DnsName DC300150562-00.local
# Résultat: IP 10.7.236.216

Write-Host "=== 4. Informations du système ==="
ipconfig /all | findstr /i "Primary"
wmic computersystem get domain

Write-Host "=== 5. Créer le trust bidirectionnel ==="
netdom trust DC-300141657-00.local /Domain:DC300150562-00.local `
    /UserD:administrator /PasswordD:* `
    /Add /Realm /TwoWay
# Résultat: The command completed successfully

Write-Host "=== 6. Ouvrir la console de gestion ==="
Domain.msc

