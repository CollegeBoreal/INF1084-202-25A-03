# verification-domaine.ps1
Write-Host "=== VERIFICATION DU DOMAINE ACTIVE DIRECTORY ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory

# Vérifier le domaine
$domainInfo = Get-ADDomain
Write-Host " Domaine: $($domainInfo.DNSRoot)" -ForegroundColor Green
Write-Host "   NetBIOS: $($domainInfo.NetBIOSName)" -ForegroundColor Gray
Write-Host "   Mode: $($domainInfo.DomainMode)" -ForegroundColor Gray

# Vérifier les contrôleurs de domaine
Write-Host "`n CONTROLEURS DE DOMAINE:" -ForegroundColor Cyan
$dcs = Get-ADDomainController -Filter *
foreach ($dc in $dcs) {
    Write-Host "   - $($dc.Name)" -ForegroundColor Gray
    Write-Host "     Site: $($dc.Site)" -ForegroundColor DarkGray
}

# Vérifier la forêt
Write-Host "`n FORET:" -ForegroundColor Cyan
$forest = Get-ADForest
Write-Host "   Nom: $($forest.Name)" -ForegroundColor Gray
Write-Host "   Mode: $($forest.ForestMode)" -ForegroundColor Gray

Write-Host "`n VERIFICATION TERMINEE!" -ForegroundColor Green
