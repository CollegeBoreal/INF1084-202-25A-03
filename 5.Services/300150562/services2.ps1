# services2.ps1 - Afficher les événements d'un service AD
param(
    [string]$ServiceName = "NTDS",
    [int]$MaxEvents = 20
)

Write-Host "=== EVENEMENTS POUR LE SERVICE: $ServiceName ===" -ForegroundColor Cyan
Write-Host "Nombre d'evenements a afficher: $MaxEvents" -ForegroundColor Yellow

# Essayer d'abord avec Get-WinEvent (plus moderne)
try {
    Write-Host "`n1. RECHERCHE DANS LES JOURNAUX MODERNES:" -ForegroundColor Green
    
    # Chercher dans différents journaux selon le service
    $logs = @()
    switch ($ServiceName) {
        "NTDS" { $logs = @("Directory Service", "Active Directory Web Services", "System") }
        "Netlogon" { $logs = @("System") }
        "DNS" { $logs = @("DNS Server", "System") }
        "DFSR" { $logs = @("DFS Replication", "System") }
        default { $logs = @("System", "Application") }
    }

    foreach ($log in $logs) {
        try {
            Write-Host "`n   Journal: $log" -ForegroundColor White
            $events = Get-WinEvent -LogName $log -MaxEvents $MaxEvents -ErrorAction SilentlyContinue | 
                     Where-Object { $_.Message -like "*$ServiceName*" } |
                     Select-Object -First $MaxEvents
            
            if ($events) {
                $events | Format-Table TimeCreated, Id, LevelDisplayName, 
                    @{Name="Message";Expression={if($_.Message.Length -gt 50){$_.Message.Substring(0,50)+"..."}else{$_.Message}}} -AutoSize
            } else {
                Write-Host "   Aucun evenement trouve pour $ServiceName" -ForegroundColor Gray
            }
        } catch {
            Write-Host "   Journal $log inaccessible" -ForegroundColor Red
        }
    }

} catch {
    Write-Host "Erreur avec Get-WinEvent: $($_.Exception.Message)" -ForegroundColor Red
}

# Méthode alternative avec Get-EventLog (pour compatibilité)
try {
    Write-Host "`n2. RECHERCHE AVEC GET-EVENTLOG (COMPATIBILITE):" -ForegroundColor Green
    
    $eventLogs = @("System", "Application", "Directory Service")
    
    foreach ($log in $eventLogs) {
        try {
            Write-Host "`n   Journal: $log" -ForegroundColor White
            $events = Get-EventLog -LogName $log -Newest $MaxEvents -ErrorAction SilentlyContinue | 
                     Where-Object { $_.Source -like "*$ServiceName*" -or $_.Message -like "*$ServiceName*" }
            
            if ($events) {
                $events | Format-Table TimeGenerated, EventID, EntryType, 
                    @{Name="Source";Expression={$_.Source}},
                    @{Name="Message";Expression={if($_.Message.Length -gt 40){$_.Message.Substring(0,40)+"..."}else{$_.Message}}} -AutoSize
            } else {
                Write-Host "   Aucun evenement trouve" -ForegroundColor Gray
            }
        } catch {
            Write-Host "   Journal $log inaccessible" -ForegroundColor Yellow
        }
    }

} catch {
    Write-Host "Erreur avec Get-EventLog: $($_.Exception.Message)" -ForegroundColor Red
}

# Résumé des événements par niveau de gravité
try {
    Write-Host "`n3. RESUME PAR NIVEAU DE GRAVITE:" -ForegroundColor Magenta
    
    $allEvents = Get-WinEvent -LogName "System" -MaxEvents 100 -ErrorAction SilentlyContinue | 
                Where-Object { $_.Message -like "*$ServiceName*" }
    
    if ($allEvents) {
        $summary = $allEvents | Group-Object LevelDisplayName | Sort-Object Count -Descending
        
        foreach ($group in $summary) {
            $color = switch ($group.Name) {
                "Error" { "Red" }
                "Warning" { "Yellow" }
                "Information" { "Green" }
                default { "White" }
            }
            Write-Host "   $($group.Name): $($group.Count) evenements" -ForegroundColor $color
        }
    } else {
        Write-Host "   Aucun evenement a analyser" -ForegroundColor Gray
    }

} catch {
    Write-Host "Impossible de generer le resume" -ForegroundColor Red
}

Write-Host "`n=== FIN DU RAPPORT ===" -ForegroundColor Cyan