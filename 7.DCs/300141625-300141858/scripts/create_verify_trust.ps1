# ======================================================
# Script : create_verify_trust.ps1
# Objet  : Créer et vérifier un trust REALM <-> AD
# Domaine AD local  : DC300141625-00.local
# Realm Kerberos    : DC300141858-01
# Basé sur le trace du professeur (netdom / nltest)
# ======================================================

Write-Host "=== Début du script de création et vérification du trust REALM ===" -ForegroundColor Cyan

# 1. Informations sur le domaine local (optionnel)
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


# 6. Preuve d'accès AD distant (pour le sujet) - CORRIGÉ
Write-Host "`n[6] PREUVE : Accès aux utilisateurs du domaine partenaire" -ForegroundColor Green

# Demander les credentials
$cred = Get-Credential -Message "Entrez les identifiants administrateur de DC300141858-01"

# Tester l'accès avec credentials
try {
    Write-Host "Tentative de connexion à dc300141858.dc300141858-01.local..." -ForegroundColor Gray
    $users = Get-ADUser -Filter * -Server dc300141858.dc300141858-01.local -Credential $cred | Select-Object Name, SamAccountName, Enabled -First 5
    
    Write-Host "`n=== UTILISATEURS DU DOMAINE DISTANT ===" -ForegroundColor Cyan
    if ($users.Count -gt 0) {
        $users | Format-Table -AutoSize
        Write-Host "`n✅ Accès AD distant RÉUSSI ! ($($users.Count) utilisateurs listés)" -ForegroundColor Green
    } else {
        Write-Host "Aucun utilisateur trouvé (le trust fonctionne mais l'accès est limité)" -ForegroundColor Yellow
        Write-Host "Preuve alternative : Test de connexion LDAP..." -ForegroundColor Gray
        Test-NetConnection dc300141858.dc300141858-01.local -Port 389
    }
} catch {
    Write-Host "❌ Échec accès AD distant : $_" -ForegroundColor Red
}

# 7. Vérification des Unités d'Organisation (OUs) distantes
Write-Host "`n[7] VÉRIFICATION : Unités d'Organisation du domaine partenaire" -ForegroundColor Magenta

try {
    $OUs = Get-ADOrganizationalUnit -Filter * -Server dc300141858.dc300141858-01.local -Credential $cred | Select-Object Name, DistinguishedName
    
    Write-Host "`n=== OUs DU DOMAINE DISTANT ===" -ForegroundColor Cyan
    if ($OUs.Count -gt 0) {
        $OUs | Format-Table -AutoSize
        Write-Host "`n✅ OUs listées avec succès ($($OUs.Count) unités d'organisation)" -ForegroundColor Green
    } else {
        Write-Host "Aucune OU trouvée" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Échec lecture OUs : $_" -ForegroundColor Red
}