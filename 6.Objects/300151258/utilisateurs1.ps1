# ---------------------------------------------------
# Script 1 : Création du groupe, utilisateurs et share
# ---------------------------------------------------

$SharedFolder = "C:\SharedResources"
$GroupName = "Students"

# Dossier partagé
New-Item -Path $SharedFolder -ItemType Directory -Force

# Groupe AD Students
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Students group"
}

# Création utilisateurs + ajout au groupe
$Users = @("Etudiant1", "Etudiant2")

foreach ($u in $Users) {
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$u'" -ErrorAction SilentlyContinue)) {
        New-ADUser -Name $u -SamAccountName $u `
            -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
            -Enabled $true
    }
    Add-ADGroupMember -Identity $GroupName -Members $u -ErrorAction SilentlyContinue
}

# Partage SMB
if (-not (Get-SmbShare -Name "SharedResources" -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName
}

