# services1.ps1 - Lister les services AD et leur état
Write-Host "=== SERVICES ACTIVE DIRECTORY ET LEUR ETAT ===" -ForegroundColor Green

# Services AD typiques
$servicesAD = @("NTDS", "ADWS", "DFSR", "kdc", "Netlogon", "IsmServ", "DNS", "DHCP", "Dfs", "SamSs", "LanmanServer")

Write-Host "Services AD surveilles:" -ForegroundColor Yellow
foreach ($service in $servicesAD) { Write-Host "  - $service" -ForegroundColor White }

Write-Host "`nETAT DES SERVICES:" -ForegroundColor Cyan

# Récupération des services
$results = Get-Service | Where-Object { $servicesAD -contains $_.Name } | Sort-Object Status, DisplayName

if ($results) {
    $results | Format-Table Name, DisplayName, Status, StartType -AutoSize
    
    # Statistiques
    $running = ($results | Where-Object Status -eq 'Running').Count
    $stopped = ($results | Where-Object Status -eq 'Stopped').Count
    
    Write-Host "`nSTATISTIQUES:" -ForegroundColor Yellow
    Write-Host "Services en cours d'execution: $running" -ForegroundColor Green
    Write-Host "Services arretes: $stopped" -ForegroundColor Red
    Write-Host "Total services AD: $($results.Count)" -ForegroundColor White
} else {
    Write-Host "Aucun service AD trouve sur ce systeme." -ForegroundColor Red
}

# Vérification des services critiques
Write-Host "`nSERVICES CRITIQUES:" -ForegroundColor Magenta
$criticalServices = @("NTDS", "kdc", "Netlogon", "DNS")
foreach ($service in $criticalServices) {
    $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($svc) {
        $color = if ($svc.Status -eq 'Running') { 'Green' } else { 'Red' }
        Write-Host "  $service : $($svc.Status)" -ForegroundColor $color
    } else {
        Write-Host "  $service : Non trouve" -ForegroundColor Yellow
    }
}