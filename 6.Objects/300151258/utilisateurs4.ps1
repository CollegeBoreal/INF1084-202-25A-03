# ===============================
# utilisateurs4.ps1
# Crée automatiquement des comptes étudiants
# Les place dans OU=Students
# Ajoute les comptes dans le groupe Students (RDP)
# ===============================

Import-Module ActiveDirectory

# -----------------------------
# VARIABLES
# -----------------------------
$OU = "OU=Students,DC=DC300151258,DC=local"
$Group = "Students"

# Nombre d'étudiants à créer
$NombreEtudiants = 10

# Mot de passe par défaut
$DefaultPassword = "Pass123!"

# -----------------------------
# BOUCLE DE CREATION DES UTILISATEURS
# -----------------------------
for ($i = 1; $i -le $NombreEtudiants; $i++) {
    $UserName = "Etudiant$i"
    $SamAccountName = $UserName

    # Vérifier si l'utilisateur existe déjà
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$SamAccountName'")) {
        # Créer l'utilisateur
        New-ADUser `
            -Name $UserName `
            -SamAccountName $SamAccountName `
            -AccountPassword (ConvertTo-SecureString $DefaultPassword -AsPlainText -Force) `
            -Enabled $true `
            -Path $OU

        Write-Host "Utilisateur $UserName créé."
    } else {
        Write-Host "Utilisateur $UserName existe déjà."
    }

    # Ajouter l'utilisateur au groupe Students (RDP)
    if (-not (Get-ADGroupMember -Identity $Group | Where-Object {$_.SamAccountName -eq $SamAccountName})) {
        Add-ADGroupMember -Identity $Group -Members $SamAccountName
        Write-Host "Utilisateur $UserName ajouté au groupe $Group."
    } else {
        Write-Host "Utilisateur $UserName est déjà membre du groupe $Group."
    }
}

Write-Host "`n=== Création des étudiants terminée ==="
