# Charger ton bootstrap
. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300141716\bootstrap.ps1"

# Chemin du dossier partagé
$SharedFolder = "C:\SharedResources"

# Créer le dossier si n'existe pas
if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
}

# Nom du groupe
$GroupName = "Students"

# Créer le groupe AD s'il n'existe pas
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"
}

# Liste des utilisateurs à créer
$Users = @("Etudiant1","Etudiant2")

foreach ($user in $Users) {

    # Vérifier si l'utilisateur existe
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {
        
        New-ADUser `
            -Name $user `
            -SamAccountName $user `
            -UserPrincipalName "$user@$domainName" `
            -Path "CN=Users,DC=DC$studentNumber-$studentInstance,DC=local" `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true
    }

    # Ajouter au groupe Students
    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

# Création du partage SMB
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {

    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName

} else {

    # Si le partage existe, mettre à jour les permissions
    Grant-SmbShareAccess -Name "SharedResources" -AccountName $GroupName -AccessRight Full -Force
}

