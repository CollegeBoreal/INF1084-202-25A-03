# --------------------------
# Bootstrap AD TP
# --------------------------

# Infos domaine
$domainName = "DC300141625-00.local"
$netbiosName = "DC300141625-00"

# Import module AD
Import-Module ActiveDirectory

# Vérifier le domaine
Get-ADDomain -Server $domainName

# --------------------------
# Créer Alice si elle n'existe pas
# --------------------------
if (-not (Get-ADUser -Filter "SamAccountName -eq 'alice.dupont'")) {
    New-ADUser -Name "Alice Dupont" `
               -GivenName "Alice" `
               -Surname "Dupont" `
               -SamAccountName "alice.dupont" `
               -UserPrincipalName "alice.dupont@$domainName" `
               -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
               -Enabled $true `
               -Path "CN=Users,DC=$netbiosName,DC=local"
    Write-Host "Utilisateur Alice Dupont créé."
} else {
    Write-Host "L'utilisateur alice.dupont existe déjà."
}

# --------------------------
# Déplacer Alice vers l'OU Students
# --------------------------
$user = Get-ADUser -Filter "SamAccountName -eq 'alice.dupont'"
if ($user) {
    # Créer l'OU Students si elle n'existe pas
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
        New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
        Write-Host "OU Students créée."
    }

    # Déplacer l'utilisateur
    Move-ADObject -Identity $user.DistinguishedName `
                  -TargetPath "OU=Students,DC=$netbiosName,DC=local"

    Write-Host "Alice Dupont déplacée vers OU=Students."
} else {
    Write-Host "Impossible de déplacer, l'utilisateur alice.dupont n'existe pas."
}

# --------------------------
# Liste des utilisateurs du domaine
# --------------------------
Get-ADUser -Filter * -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
