# Charger les informations du bootstrap
. "C:\Users\kelek\developer\INF1084-202-25A-03\4.OUs\300133071\bootstrap.ps1"

# Définir le chemin du dossier partagé
$SharedFolder = "C:\Users\kelek\developer\INF1084-202-25A-03\6.DCs\300133071\SharedResources"

# Créer le dossier
if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force
    Write-Host "��� Dossier créé : $SharedFolder"
} else {
    Write-Host " Dossier déjà existant : $SharedFolder"
}

# Créer le groupe AD
$GroupName = "Students"
New-ADGroup -Name $GroupName `
    -GroupScope Global `
    -GroupCategory Security `
    -Description "Users allowed RDP and shared folder access" `
    -Server $domainName `
    -Credential $cred

# Créer des utilisateurs et les ajouter au groupe
$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user `
        -SamAccountName $user `
        -UserPrincipalName "$user@$domainName" `
        -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
        -Enabled $true `
        -Server $domainName `
        -Credential $cred

    Add-ADGroupMember -Identity $GroupName -Members $user -Server $domainName -Credential $cred
}

# Créer le partage SMB et donner 'accès complet au groupe

if (-not (Get-SmbShare -Name $shareName -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name $shareName `
        -Path $SharedFolder `
        -FullAccess "$netbiosName\$GroupName"
    Write-Host " Partage SMB créé : \\$netbiosName\$shareName"
} else {
    Write-Host "Le partage SMB '$shareName' existe déjà."
}
