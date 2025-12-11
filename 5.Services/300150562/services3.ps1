# services3.ps1 - Capturer les événements d'un service AD dans un fichier
param(
    [string]$ServiceName = "NTDS",
    [string]$OutputPath = "C:\Logs\AD_Events_$ServiceName.csv",
    [int]$MaxEvents = 50,
    [string]$LogName = "Directory Service"
)

Write-Host "=== CAPTURE DES EVENEMENTS AD DANS UN FICHIER ===" -ForegroundColor Magenta
Write-Host "Service: $ServiceName" -ForegroundColor Yellow
Write-Host "Journal: $LogName" -ForegroundColor Yellow
Write-Host "Evenements: $MaxEvents" -ForegroundColor Yellow
Write-Host "Fichier de sortie: $OutputPath" -ForegroundColor Yellow

# Créer le dossier de destination s'il n'existe pas
$logDirectory = Split-Path -Path $OutputPath -Parent
if (!(Test-Path $logDirectory)) {
    Write-Host "Creation du dossier: $logDirectory" -ForegroundColor Cyan
    New-Item -ItemType Directory -Path $logDirectory -Force | Out-Null
}

try {
    Write-Host "`nRecuperation des evenements..." -ForegroundColor Green
    
    # Récupérer les événements
    $events = Get-WinEvent -LogName $LogName -MaxEvents $MaxEvents -ErrorAction Stop
    
    if ($events) {
        # Préparer les données pour l'export
        $exportData = $events | ForEach-Object {
            [PSCustomObject]@{
                TimeCreated = $_.TimeCreated
                Id = $_.Id
                Level = $_.LevelDisplayName
                Provider = $_.ProviderName
                MachineName = $_.MachineName
                UserId = $_.UserId
                Message = $_.Message -replace "`n|`r", " "  # Nettoyer les sauts de ligne
            }
        }
        
        # Exporter en CSV
        $exportData | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8
        
        # Statistiques
        Write-Host "`n=== EXPORT REUSSI ===" -ForegroundColor Green
        Write-Host "Evenements exportes: $($events.Count)" -ForegroundColor White
        Write-Host "Periode couverte: du $($events[-1].TimeCreated) au $($events[0].TimeCreated)" -ForegroundColor White
        
        # Résumé par niveau
        $summary = $events | Group-Object LevelDisplayName
        Write-Host "`nRepartition par niveau:" -ForegroundColor Cyan
        foreach ($group in $summary) {
            $color = switch ($group.Name) {
                "Error" { "Red" }
                "Warning" { "Yellow" }
                "Information" { "Green" }
                default { "White" }
            }
            Write-Host "  $($group.Name): $($group.Count)" -ForegroundColor $color
        }
        
        # Aperçu du fichier
        Write-Host "`nApercu du fichier CSV:" -ForegroundColor Cyan
        Get-Content $OutputPath | Select-Object -First 5 | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
        
    } else {
        Write-Host "Aucun evenement trouve dans le journal $LogName" -ForegroundColor Yellow
    }
    
} catch [System.Exception] {
    if ($_.Exception.Message -like "*No events were found*") {
        Write-Host "Aucun evenement trouve dans le journal $LogName" -ForegroundColor Yellow
    } elseif ($_.Exception.Message -like "*The system cannot find the file specified*") {
        Write-Host "ERREUR: Le journal '$LogName' n'existe pas sur ce systeme" -ForegroundColor Red
        Write-Host "Journaux disponibles:" -ForegroundColor Yellow
        Get-WinEvent -ListLog *Directory* | Format-Table LogName, RecordCount -AutoSize
    } else {
        Write-Host "ERREUR: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Vérifier que le fichier a été créé
if (Test-Path $OutputPath) {
    $fileInfo = Get-Item $OutputPath
    Write-Host "`nFichier cree avec succes:" -ForegroundColor Green
    Write-Host "  Taille: $([math]::Round($fileInfo.Length/1KB, 2)) KB" -ForegroundColor White
    Write-Host "  Emplacement: $OutputPath" -ForegroundColor White
} else {
    Write-Host "`nAUCUN FICHIER CREE - Verifiez les erreurs ci-dessus" -ForegroundColor Red
}