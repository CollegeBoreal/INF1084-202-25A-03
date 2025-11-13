<<<<<<< HEAD

. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Lister tous les utilisateurs dont le nom commence par "B"
write-host "`nliste  les utilisateurs dont le nom commence par B`n"
$Users | Where-Object {$_.Nom -like "B*"}|Format-Table

# Lister tous les utilisateurs dans l'OU "Stagiaires"
write-host "`nliste  les utilisateurs dans l'OU est stagiaires`n"
$Users | Where-Object {$_.OU -eq "Stagiaires"}|Format-Table
# Lister tous les utilisateurs dans le prenom contient a "majuscule ou miniscule: donc incensible a la casse"
write-host "`nliste  les utilisateurs dont le prenom contient a majuscule ou miniscule`n"
$Users | Where-Object {$_.Prenom -like "*a*"}|Format-Table
=======
# ===== utilisateurs3.ps1 : Gestion d'un utilisateur =====

New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@$domainName" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=$netbiosName,DC=local" `
           -Credential $cred

Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie" `
           -Credential $cred

Disable-ADAccount -Identity "alice.dupont" -Credential $cred

Enable-ADAccount -Identity "alice.dupont" -Credential $cred

# Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

>>>>>>> c8fc1e6666a8b24b02fb49c7196da3d313e7cf38
