# Variables du domaine
$domainName = "DC300151469-00.local"
$ouStudents = "OU=Students,DC=DC300151469-00,DC=local"
$defaultPassword = ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force

# Vérifier si l'utilisateur existe déjà
$user = Get-ADUser -Filter "SamAccountName -eq 'alice.dupont'" -Server $domainName -SearchBase $ouStudents -ErrorAction SilentlyContinue

if (-not $user) {
    # Créer l'utilisateur
    New-ADUser -Name "Alice Dupont" `
        -GivenName "Alice" `
        -Surname "Dupont" `
        -SamAccountName "alice.dupont" `
        -UserPrincipalName "alice.dupont@$domainName" `
        -AccountPassword $defaultPassword `
        -Enabled $true `
        -Path $ouStudents `
        -Server $domainName
    Write-Host "Alice Dupont a été créé."
} else {
    Write-Host "Alice Dupont existe déjà."
}

# Vérifier le statut de l'utilisateur
$user = Get-ADUser -Filter "SamAccountName -eq 'alice.dupont'" -Server $domainName -SearchBase $ouStudents -Properties Enabled
Write-Host "Alice Dupont - Activé: $($user.Enabled)"

