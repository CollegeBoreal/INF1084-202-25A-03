# utilisateurs8.ps1
Write-Host "=== EXPORT UTILISATEURS VERS CSV ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory
$domain = "DC300150562-00.local"
$csvPath = "TP_AD_Users.csv"

Write-Host "`n Récupération des utilisateurs..." -ForegroundColor Cyan
$users = Get-ADUser -Filter * -Server $domain -Properties Name, SamAccountName, EmailAddress, Enabled |
    Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt","DefaultAccount") } |
    Select-Object Name, SamAccountName, EmailAddress, Enabled

Write-Host " $($users.Count) utilisateur(s) trouvé(s)" -ForegroundColor Green

if ($users.Count -gt 0) {
    Write-Host "`n Export vers CSV..." -ForegroundColor Cyan
    $users | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8
    
    if (Test-Path $csvPath) {
        Write-Host " Export réussi: $csvPath" -ForegroundColor Green
        Write-Host "`n Aperçu:" -ForegroundColor Cyan
        Import-Csv -Path $csvPath | Select-Object -First 5 | Format-Table -AutoSize
    }
}

Write-Host "`n Terminé!" -ForegroundColor Green
