# ==============================
# Dot-sourcing du bootstrap
# ==============================
. .\bootstrap.ps1


# ==============================
# Création du dossier partagé
# ==============================
$SharedFolder = "C:\SharedResources"
New-Item -Path $SharedFolder -ItemType Directory -Force

# Groupe AD
$GroupName = "Students"
New-ADGroup -Name $GroupName -GroupScope Global -Description "Accès au partage et au RDP"

# Utilisateurs
$Users = @("Etudiant1", "Etudiant2")

foreach ($user in $Users) {
    New-ADUser `
        -Name $user `
        -SamAccountName $user `
        -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
        -Enabled $true `
        -Path "OU=Students,DC=$netbiosName,DC=local"

    Add-ADGroupMember -Identity $GroupName -Members $user
}

# Partage SMB
New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName

