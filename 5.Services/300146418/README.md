# TP Services Windows / Active Directory

## Auteur
Nom : Ikram  
Numéro étudiant : 300146418  

## Objectifs du TP
- Identifier et lister les services Windows critiques pour Active Directory.
- Vérifier l’état des services AD.
- Consulter les logs liés aux services AD.
- Exporter des logs pour analyse.
- Démarrer, arrêter et redémarrer des services AD.

## Fichiers créés pour le TP

### services1.ps1
Write-Host "Liste des services liés à Active Directory..." -ForegroundColor Cyan
Get-Service | Where-Object { $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ" } | Sort-Object DisplayName
Write-Host "Vérification de l'état des services principaux AD..." -ForegroundColor Cyan
Get-Service -Name NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ

### services2.ps1
Get-EventLog -LogName "Directory Service" -Newest 20
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 | Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize

### services3.ps1
$exportPath = "C:\Logs\ADLogs.csv"
if (-not (Test-Path "C:\Logs")) { New-Item -ItemType Directory -Path "C:\Logs" }
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path $exportPath -NoTypeInformation
Write-Host "Événements exportés dans $exportPath" -ForegroundColor Green

### services4.ps1
Write-Host "Arrêt du service DFSR..." -ForegroundColor Cyan
Stop-Service -Name DFSR
Write-Host "État après arrêt :" -ForegroundColor Yellow
(Get-Service -Name DFSR).Status
Write-Host "Redémarrage du service DFSR..." -ForegroundColor Cyan
Start-Service -Name DFSR
Write-Host "État après redémarrage :" -ForegroundColor Yellow
(Get-Service -Name DFSR).Status

## Étapes d’exécution
1. Ouvrir PowerShell en mode administrateur.
2. Se rendre dans le dossier TP :
cd C:\Users\Administrator\TP_Services_AD
3. Lancer les scripts dans cet ordre :
.\services1.ps1
.\services2.ps1
.\services3.ps1
.\services4.ps1
4. Vérifier que :
- Les services AD sont visibles et fonctionnels.
- Les logs sont affichés et le fichier C:\Logs\ADLogs.csv est créé.
- DFSR a bien été redémarré.

## Résultats attendus
- Tous les services AD sont listés et leur état est connu.
- Les 20 derniers événements AD et système sont affichés.
- Un fichier CSV contenant les 50 derniers événements AD est créé.
- Le service DFSR est arrêté puis redémarré, et son état est vérifié.

## Bonnes pratiques
- Toujours vérifier l’état d’un service avant de l’arrêter.
- Sur un DC, consultez le journal Directory Service dans Event Viewer pour détecter les problèmes AD.
- Exporter régulièrement les logs pour analyse et sauvegarde.

## Références
- Active Directory Services : NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ
- PowerShell : Get-Service, Get-EventLog, Get-WinEvent, Export-Csv, Stop-Service, Start-Service

