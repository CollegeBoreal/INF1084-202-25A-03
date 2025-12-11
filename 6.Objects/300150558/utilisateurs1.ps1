Import-Module ActiveDirectory

# Charger les infos du domaine depuis 4.OUs\300150558\bootstrap.ps1
. "..\..\4.OUs\300150558\bootstrap.ps1"

Write-Host "=== Étape 1 : Dossier partagé, groupe Students et utilisateurs ===" -ForegroundColor Cyan

# 1) Créer le dossier partagé
$SharedFolder = "C:\SharedResources"

if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
    Write-Host "[OK] Dossier $SharedFolder créé." -ForegroundColor Green
} else {
    Write-Host "[!] Dossier $SharedFolder existe déjà." -ForegroundColor Yellow
}

# 2) Créer le groupe Students
$GroupName = "Students"

$adGroup = Get-ADGroup -Filter "SamAccountName -eq '$GroupName'" -ErrorAction SilentlyContinue
if (-not $adGroup) {
    New-ADGroup `
        -Name $GroupName `
        -SamAccountName $GroupName `
        -GroupScope Global `
        -GroupCategory Security `
        -Description "Users allowed RDP and shared folder access" | Out-Null

    Write-Host "[OK] Groupe $GroupName créé." -ForegroundColor Green
} else {
    Write-Host "[!] Groupe $GroupName existe déjà : $($adGroup.DistinguishedName)" -ForegroundColor Yellow
}

# 3) Créer les utilisateurs et les ajouter au groupe
$Users = @("Etudiant1","Etudiant2")

foreach ($user in $Users) {
    $adUser = Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue

    if (-not $adUser) {
        New-ADUser `
            -Name $user `
            -SamAccountName $user `
            -UserPrincipalName "$user@$domainName" `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true

        Write-Host "[OK] Utilisateur $user créé." -ForegroundColor Green
    } else {
        Write-Host "[!] Utilisateur $user existe déjà : $($adUser.DistinguishedName)" -ForegroundColor Yellow
    }

    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

# 4) Créer le partage SMB pour le groupe Students
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    # Tu peux aussi mettre -FullAccess $GroupName, mais avec le NetBIOS c'est plus explicite
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess "$netbiosName\$GroupName" | Out-Null
    Write-Host "[OK] Partage SMB créé : \\$netbiosName\SharedResources" -ForegroundColor Green
} else {
    Write-Host "[!] Partage SMB 'SharedResources' existe déjà." -ForegroundColor Yellow
}

