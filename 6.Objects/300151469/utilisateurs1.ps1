# --- Script utilisateurs1.ps1 robuste ---

# Variables
$SharedFolder = "C:\SharedResources"
$GroupName = "Students"
$Users = @("Etudiant1","Etudiant2")
$ShareName = "SharedResources"

# 1️⃣ Créer le dossier local si inexistant
if (-not (Test-Path $SharedFolder)) {
    New-Item -Path $SharedFolder -ItemType Directory -Force | Out-Null
}

# 2️⃣ Créer le groupe AD seulement s'il n'existe pas
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    try {
        New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"
        Write-Host "Groupe '$GroupName' créé."
    } catch {
        Write-Warning "Impossible de créer le groupe '$GroupName'. Il existe peut-être déjà."
    }
} else {
    Write-Host "Groupe '$GroupName' existe déjà."
}

# 3️⃣ Créer les utilisateurs AD seulement s'ils n'existent pas et les ajouter au groupe
foreach ($user in $Users) {
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {
        try {
            New-ADUser -Name $user `
                       -SamAccountName $user `
                       -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
                       -Enabled $true
            Write-Host "Utilisateur '$user' créé."
        } catch {
            Write-Warning "Impossible de créer l'utilisateur '$user'."
        }
    } else {
        Write-Host "Utilisateur '$user' existe déjà."
    }

    # Ajouter au groupe (ignore erreur si déjà membre)
    try {
        Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
        Write-Host "Utilisateur '$user' ajouté au groupe '$GroupName'."
    } catch {}
}

# 4️⃣ Créer le partage SMB seulement s'il n'existe pas
if (-not (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue)) {
    try {
        New-SmbShare -Name $ShareName -Path $SharedFolder -FullAccess $GroupName
        Write-Host "Partage SMB '$ShareName' créé."
    } catch {
        Write-Warning "Impossible de créer le partage SMB '$ShareName'."
    }
} else {
    # Mettre à jour permissions si nécessaire
    Grant-SmbShareAccess -Name $ShareName -AccountName $GroupName -AccessRight Full -Force
    Write-Host "Permissions du partage '$ShareName' mises à jour."
}

Write-Host "Script terminé."


