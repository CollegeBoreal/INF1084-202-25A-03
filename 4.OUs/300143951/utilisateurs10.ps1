# Définir le domaine automatiquement
$domain = (Get-ADDomain).DNSRoot
$netbios = (Get-ADDomain).NetBIOSName
# Nom de l'utilisateur à déplacer
$userSam = "francky"

Write-Host "Verification de l'utilisateur '$userSam' dans le domaine..." -ForegroundColor Cyan

# Vérifier si l'utilisateur existe
$user = Get-ADUser -Filter "SamAccountName -eq '$userSam'" -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "Erreur : L'utilisateur '$userSam' n'existe pas ou n appartient pas au domaine '$domain'." -ForegroundColor Red
    exit
}

Write-Host "Utilisateur trouve : $($user.Name)" -ForegroundColor Green

# Vérifier si l'OU Students existe
$ouPath = "OU=Students,DC=$netbios,DC=local"

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    Write-Host "OU 'Students' absente. Création en cours..." -ForegroundColor Yellow
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbios,DC=local"
    Write-Host "OU 'Students' creee avec succes." -ForegroundColor Green
} else {
    Write-Host "OU 'Students' dejà existante." -ForegroundColor Green
}

# Déplacement
Write-Host "Deplacement de l'utilisateur '$userSam' vers l'OU Students..." -ForegroundColor Cyan

try {
    Move-ADObject -Identity $user.DistinguishedName `
                  -TargetPath $ouPath `
                  -ErrorAction Stop

    Write-Host "Succes : L'utilisateur '$userSam' a ete deplace dans l'OU 'Students'." -ForegroundColor Green

    # Vérification
    $updatedUser = Get-ADUser -Identity $userSam -Properties DistinguishedName
    Write-Host "Nouvel emplacement : $($updatedUser.DistinguishedName)" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors du déplacement : $($_.Exception.Message)" -ForegroundColor Red
}

