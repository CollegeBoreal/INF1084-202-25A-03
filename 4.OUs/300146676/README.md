# 🚀 TP : Gestion des utilisateurs Active Directory avec PowerShell
# Étudiant : Aymen Harkati
# Numéro étudiant : 300146676

# 0️⃣ Configuration du domaine
$studentNumber = 300146676
$studentInstance = 0

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# 1️⃣ Préparer l'environnement
Import-Module ActiveDirectory
Write-Host "=== Domaine et contrôleurs ==="
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName

# 2️⃣ Lister les utilisateurs actifs
Write-Host "=== Liste des utilisateurs actifs ==="
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

# 3️⃣ Créer un nouvel utilisateur
Write-Host "=== Création utilisateur Alice Dupont ==="
New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

# 4️⃣ Modifier l'utilisateur
Write-Host "=== Modification utilisateur ==="
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

# 5️⃣ Désactiver l'utilisateur
Write-Host "=== Désactivation utilisateur ==="
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

# 6️⃣ Réactiver l'utilisateur
Write-Host "=== Réactivation utilisateur ==="
Enable-ADAccount -Identity "alice.dupont" -Credential $cred

# 7️⃣ Supprimer un utilisateur (optionnel)
# Write-Host "=== Suppression utilisateur ==="
# Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

# 8️⃣ Rechercher des utilisateurs avec un filtre
Write-Host "=== Recherche utilisateurs prénom commençant par A ==="
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

# 9️⃣ Exporter les utilisateurs dans un CSV
Write-Host "=== Export des utilisateurs vers TP_AD_Users.csv ==="
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

# 1️⃣0️⃣ Déplacer l'utilisateur vers une OU Students
Write-Host "=== Création OU Students si nécessaire et déplacement utilisateur ==="
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

# Vérification du déplacement
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName

Write-Host "=== TP terminé : gestion complète des utilisateurs AD ==="
