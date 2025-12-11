# Variables du domaine
$domainName = "DC300151469-00.local"
$ouStudents = "OU=Students,DC=DC300151469-00,DC=local"
$defaultPassword = ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force

# Vérifier si l'utilisateur existe déjà
$user = Get-ADUser -Filter "SamAccountName -eq 'clara.leroy'" -Server $domainName -SearchBase $ouStudents -ErrorAction SilentlyContinue

if (-not $user) {
    # Créer l'utilisateur
    New-ADUser -Name "Clara Leroy" `
        -GivenName "Clara" `
        -Surname "Leroy" `
        -SamAccountName "clara.leroy" `
        -UserPrincipalName "clara.leroy@$domainName" `
        -AccountPassword $defaultPassword `
        -Enabled $true `
        -Path $ouStudents `
        -Server $domainName
    Write-Host "Clara Leroy a été créée."
} else {
    Write-Host "Clara Leroy existe déjà."
}

# Vérifier le statut de l'utilisateur
$user = Get-ADUser -Filter "SamAccountName -eq 'clara.leroy'" -Server $domainName -SearchBase $ouStudents -Properties Enabled
Write-Host "Clara Leroy - Activé: $($user.Enabled)"

