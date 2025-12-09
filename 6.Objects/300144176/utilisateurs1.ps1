# Charger les informations du bootstrap
. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300144176\bootstrap.ps1"

# Chemin du dossier
$SharedFolder = "C:\SharedResources"

# Créer le dossier (si déjà existe, -Force évite l'erreur)
if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
}

# Nom du groupe
$GroupName = "Students"

# Créer le groupe AD seulement s'il n'existe pas
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"
}

# Liste des utilisateurs
$Users = @("Etudiant1","Etudiant2")

# Créer les utilisateurs et les ajouter au groupe
foreach ($user in $Users) {

    # Vérifier s'il existe déjà
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name $user `
            -SamAccountName $user `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true
    }

    # Ajouter au groupe (evite l'erreur si déjà membre)
    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

# Créer un partage SMB
# Vérifier si le partage existe déjà
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
} else {
    # Mettre à jour les permissions au cas où le groupe ne serait pas présent
    Grant-SmbShareAccess -Name "SharedResources" -AccountName $GroupName -AccessRight Full -Force
}
