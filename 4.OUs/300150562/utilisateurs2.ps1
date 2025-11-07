# liste-utilisateurs-actifs.ps1
Write-Host "=== LISTE DES UTILISATEURS ACTIFS AD ===" -ForegroundColor Cyan
Write-Host "Domaine: DC300150562-00.local" -ForegroundColor Yellow

Import-Module ActiveDirectory
$domainName = "DC300150562-00.local"

Write-Host "`n Recherche des utilisateurs actifs..." -ForegroundColor Cyan

$users = Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled, DistinguishedName |
    Where-Object { 
        $_.Enabled -eq $true -and 
        $_.SamAccountName -notin @("Administrator", "Guest", "krbtgt", "DefaultAccount") 
    } |
    Select-Object Name, SamAccountName, DistinguishedName

if ($users.Count -gt 0) {
    Write-Host " $($users.Count) utilisateur(s) actif(s) trouvé(s) :" -ForegroundColor Green
    $users | Format-Table -AutoSize
} else {
    Write-Host "ℹ Aucun utilisateur actif trouvé" -ForegroundColor Yellow
}

Write-Host "`n Terminé!" -ForegroundColor Green
