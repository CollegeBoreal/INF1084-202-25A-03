# ===============================================
# utilisateurs1.ps1 - Préparer l'environnement AD
# ===============================================

Write-Host "=== Importation du module Active Directory ===" -ForegroundColor Cyan

# Importer le module AD si ce n'est pas déjà fait
if (-not (Get-Module -Name ActiveDirectory)) {
    Import-Module ActiveDirectory -ErrorAction Stop
    Write-Host "[OK] Module Active Directory importé." -ForegroundColor Green
} else {
    Write-Host "[INFO] Module Active Directory déjà chargé." -ForegroundColor Yellow
}

Write-Host "`n=== Vérification du domaine et des contrôleurs de domaine ===" -ForegroundColor Cyan

try {
    $domain = Get-ADDomain -Server $domainName -ErrorAction Stop
    Write-Host "[OK] Domaine trouvé : $($domain.Name)" -ForegroundColor Green

    $DCs = Get-ADDomainController -Filter * -Server $domainName -ErrorAction Stop
    Write-Host "[OK] Contrôleurs de domaine :" -ForegroundColor Green
    $DCs | ForEach-Object { Write-Host " - $($_.Name) : $($_.IPv4Address)" }
} catch {
    Write-Host "[ERREUR] Impossible de récupérer le domaine ou les DC : $_" -ForegroundColor Red
}

