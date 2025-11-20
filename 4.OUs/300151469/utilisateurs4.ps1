# Variables du domaine
$domainName = "DC300151469-00.local"
$ouStudents = "OU=Students,DC=DC300151469-00,DC=local"
$defaultPassword = ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force

# Vérifier si l'utilisateur existe déjà
$user = Get-ADUser -Filter "SamAccountName -eq 'david.petit'" -Server $domainName -SearchBase $ouStudents -ErrorAction SilentlyContinue

if (-not $user) {
    # Créer l'utilisateur
    New-ADUser -Name "David Petit" `
        -GivenName "David" `
        -Surname "Petit" `
        -SamAccountName "david.petit" `
        -UserPrincipalName "david.petit@$domainName" `
        -AccountPassword $defaultPassword `
        -Enabled $true `
        -Path $ouStudents `
        -Server $domainName
    Write-Host "David Petit a été créé."
} else {
    Write-Host "David Petit existe déjà."
}

# Vérifier le statut de l'utilisateur
$user = Get-ADUser -Filter "SamAccountName -eq 'david.petit'" -Server $domainName -SearchBase $ouStudents -Properties Enabled
Write-Host "David Petit - Activé: $($user.Enabled)"

