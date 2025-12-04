. .\bootstrap.ps1
Import-Module ActiveDirectory

# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

# Déplacement d'Alice
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

# Vérification
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName
