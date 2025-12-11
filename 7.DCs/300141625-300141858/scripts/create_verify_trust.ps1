# ======================================================
# Script : create_verify_trust.ps1
# Objet  : Créer et vérifier un trust REALM <-> AD
# Domaine AD local  : DC300141625-00.local
# Realm Kerberos    : DC300141858-01
# Basé sur le trace du professeur (netdom / nltest / klist)
# ======================================================

Write-Host "=== Début du script de création et vérification du trust REALM ===" -ForegroundColor Cyan

# 1. Informations sur le domaine AD local (optionnel)
Write-Host "`n[1] Informations sur le domaine AD local :" -ForegroundColor Yellow
try {
    Get-ADDomain | Select-Object DNSRoot, NetBIOSName, Forest
} catch {
    Write-Host "Get-ADDomain indisponible - ce n'est pas bloquant pour le trust REALM." -ForegroundColor DarkYellow
}

# 2. Création du trust REALM bidirectionnel avec NETDOM
Write-Host "`n[2] Création du trust REALM bidirectionnel (Two-way, non transitif)..." -ForegroundColor Yellow
Write-Host "Commande exécutée :" -ForegroundColor Gray
Write-Host "netdom trust DC300141625-00 /Domain:DC300141858-01 /UserD:Administrator /PasswordD:* /Add /Realm /TwoWay" -ForegroundColor Gray

netdom trust DC300141625-00 `
    /Domain:DC300141858-01 `
    /UserD:Administrator `
    /PasswordD:* `
    /Add `
    /Realm `
    /TwoWay

# 3. Vérification basique avec NLTEST
Write-Host "`n[3] Vérification des domaines approuvés (nltest /trusted_domains)..." -ForegroundColor Yellow
nltest /trusted_domains

# 4. Vérification détaillée depuis le DC local
Write-Host "`n[4] Vérification détaillée depuis DC300141625-00 (nltest /server:... /trusted_domains)..." -ForegroundColor Yellow
nltest /server:DC300141625-00 /trusted_domains

# 5. Affichage des tickets Kerberos (klist)
Write-Host "`n[5] Tickets Kerberos actuels (klist)..." -ForegroundColor Yellow
klist

Write-Host "`n=== Script terminé : trust REALM <-> AD testé ===" -ForegroundColor Cyan
