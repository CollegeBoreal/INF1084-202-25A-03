$users = Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
         Select-Object Name, SamAccountName

if ($users) {
    $users
} else {
    Write-Host "Aucun utilisateur trouve correspondant au filtre." -ForegroundColor Yellow
}

