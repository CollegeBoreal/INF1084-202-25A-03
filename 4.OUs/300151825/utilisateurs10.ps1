# 🔟 Déplacer un utilisateur vers une OU Students

# Créer l’OU si elle n’existe pas
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local" -Credential $cred
    Write-Host "OU 'Students' créée avec succès ✅"
} else {
    Write-Host "OU 'Students' existe déjà."
}

# Déplacer l’utilisateur depuis CN=Users
Move-ADObject -Identity "CN=Thomas Girard,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

# Vérifier le déplacement
Get-ADUser -Identity "thomas.girard" | Select-Object Name, DistinguishedName
