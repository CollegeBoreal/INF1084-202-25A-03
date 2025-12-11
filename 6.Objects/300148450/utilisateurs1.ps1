<# =========================================================
 Script utilisateurs1.ps1 – Partage de ressources AD
 Domaine : DC300148450-00.local
========================================================= #>


# Charger les informations du domaine
. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300148450\bootstrap.ps1"

Import-Module ActiveDirectory

Write-Host "=== 1. Création du dossier partagé ==="

$SharedFolder = "C:\SharedResources"
New-Item -Path $SharedFolder -ItemType Directory -Force
Write-Host "Dossier créé : $SharedFolder"

# Nom du groupe
$GroupName = "Students"

Write-Host "=== 2. Création du groupe AD Students ==="

# Créer le groupe Students s'il n'existe pas
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"
    Write-Host "Groupe Students créé."
} else {
    Write-Host "Groupe Students déjà existant."
}

Write-Host "=== 3. Création des utilisateurs AD ==="

$Users = @("Etudiant1", "Etudiant2")

foreach ($user in $Users) {
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$user'" -ErrorAction SilentlyContinue)) {
        New-ADUser -Name $user `
                   -SamAccountName $user `
                   -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) `
                   -Enabled $true
        Write-Host "Utilisateur créé : $user"
    } else {
        Write-Host "Utilisateur existe déjà : $user"
    }

    Add-ADGroupMember -Identity $GroupName -Members $user -ErrorAction SilentlyContinue
}

Write-Host "=== 4. Partage SMB du dossier pour le groupe Students ==="

New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName -ErrorAction SilentlyContinue

Write-Host "`n=== Script utilisateurs1.ps1 terminé avec succès ==="

