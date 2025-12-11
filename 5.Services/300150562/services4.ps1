# services4.ps1 - Arret et redemarrage d'un service AD
param(
    [Parameter(Mandatory=$true)]
    [string]$ServiceName,
    
    [int]$WaitSeconds = 5,
    [switch]$Force
)

Write-Host "=== ARRET ET REDEMARRAGE DU SERVICE: $ServiceName ===" -ForegroundColor Cyan

# Verification des privileges administrateur
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "ATTENTION: Ce script necessite des privileges administrateur!" -ForegroundColor Red
    Write-Host "Veuillez executer PowerShell en tant qu'administrateur." -ForegroundColor Yellow
    exit 1
}

try {
    # Verifier que le service existe
    Write-Host "Verification du service..." -ForegroundColor Yellow
    $service = Get-Service -Name $ServiceName -ErrorAction Stop
    
    Write-Host "`nINFORMATIONS DU SERVICE:" -ForegroundColor Green
    Write-Host "  Nom: $($service.Name)" -ForegroundColor White
    Write-Host "  Nom complet: $($service.DisplayName)" -ForegroundColor White
    Write-Host "  Etat actuel: $($service.Status)" -ForegroundColor $(if($service.Status -eq 'Running'){'Green'}else{'Red'})
    Write-Host "  Type demarrage: $($service.StartType)" -ForegroundColor White
    
    # Etape 1: Arret du service
    if ($service.Status -eq 'Running') {
        Write-Host "`n1. ARRET DU SERVICE..." -ForegroundColor Yellow
        
        if ($Force) {
            Stop-Service -Name $ServiceName -Force
            Write-Host "   Arret force du service" -ForegroundColor Red
        } else {
            Stop-Service -Name $ServiceName
            Write-Host "   Arret normal du service" -ForegroundColor Yellow
        }
        
        # Attente et verification de l'arret
        $timeout = 30
        $counter = 0
        Write-Host "   Attente de l'arret..." -ForegroundColor Gray
        
        while ((Get-Service -Name $ServiceName).Status -ne 'Stopped' -and $counter -lt $timeout) {
            Write-Host "   ... ($counter/$timeout seconds)" -ForegroundColor Gray
            Start-Sleep -Seconds 1
            $counter++
        }
        
        $stoppedService = Get-Service -Name $ServiceName
        if ($stoppedService.Status -eq 'Stopped') {
            Write-Host "   SUCCES: Service arrete" -ForegroundColor Green
            Write-Host "   Etat verifie: $($stoppedService.Status)" -ForegroundColor Green
        } else {
            Write-Host "   ERREUR: Le service n'a pas pu s'arreter" -ForegroundColor Red
            Write-Host "   Etat actuel: $($stoppedService.Status)" -ForegroundColor Red
        }
        
        # Pause avant redemarrage
        Write-Host "`n2. PAUSE DE $WaitSeconds SECONDES..." -ForegroundColor Cyan
        for ($i = $WaitSeconds; $i -gt 0; $i--) {
            Write-Host "   Redemarrage dans $i..." -ForegroundColor Gray
            Start-Sleep -Seconds 1
        }
        
    } else {
        Write-Host "`nLe service n'est pas en cours d'execution. Demarrage direct..." -ForegroundColor Yellow
    }
    
    # Etape 2: Redemarrage du service
    Write-Host "`n3. REDEMARRAGE DU SERVICE..." -ForegroundColor Yellow
    Start-Service -Name $ServiceName
    
    # Attente et verification du demarrage
    $timeout = 30
    $counter = 0
    Write-Host "   Attente du demarrage..." -ForegroundColor Gray
    
    while ((Get-Service -Name $ServiceName).Status -ne 'Running' -and $counter -lt $timeout) {
        Write-Host "   ... ($counter/$timeout seconds)" -ForegroundColor Gray
        Start-Sleep -Seconds 1
        $counter++
    }
    
    $restartedService = Get-Service -Name $ServiceName
    if ($restartedService.Status -eq 'Running') {
        Write-Host "   SUCCES: Service redemarre" -ForegroundColor Green
        Write-Host "   Etat verifie: $($restartedService.Status)" -ForegroundColor Green
    } else {
        Write-Host "   ERREUR: Le service n'a pas pu demarrer" -ForegroundColor Red
        Write-Host "   Etat actuel: $($restartedService.Status)" -ForegroundColor Red
    }
    
    # Resume final
    Write-Host "`n=== RESUME FINAL ===" -ForegroundColor Magenta
    Write-Host "Service: $ServiceName" -ForegroundColor White
    Write-Host "Etat final: $($restartedService.Status)" -ForegroundColor $(if($restartedService.Status -eq 'Running'){'Green'}else{'Red'})
    Write-Host "Operation terminee a: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor White
    
} catch [System.ServiceProcess.TimeoutException] {
    Write-Host "ERREUR: Timeout lors de l'operation sur le service" -ForegroundColor Red
} catch [System.InvalidOperationException] {
    Write-Host "ERREUR: Operation impossible sur le service - Verifiez les dependances" -ForegroundColor Red
} catch {
    Write-Host "ERREUR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "`nServices disponibles similaires:" -ForegroundColor Yellow
    Get-Service | Where-Object { $_.Name -like "*$ServiceName*" -or $_.DisplayName -like "*$ServiceName*" } | Format-Table Name, DisplayName, Status -AutoSize
}