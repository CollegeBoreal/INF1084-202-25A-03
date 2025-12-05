# utilisateurs4.ps1

$searchBase = "CN=Users,DC=DC300150558-00,DC=local"

Write-Host "Recherche d'utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase $searchBase |
    Select-Object Name, SamAccountName

Write-Host "Exporter les utilisateurs..." -ForegroundColor Cyan
Get-ADUser -Filter * -SearchBase $searchBase |
    Select-Object Name, SamAccountName, Enabled |
    Export-Csv -Path ".\export_utilisateurs.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Suppression d'un utilisateur..." -ForegroundColor Cyan
$user = Get-ADUser -Identity "marc.petit" -ErrorAction SilentlyContinue

if ($user) {
    Remove-ADUser -Identity $user -Confirm:$false
    Write-Host "Utilisateur 'marc.petit' supprimé." -ForegroundColor Green
} else {
    Write-Host "Utilisateur 'marc.petit' n'existe pas, rien à supprimer." -ForegroundColor Yellow
}

