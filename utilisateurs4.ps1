# ===== utilisateurs4.ps1 : Créer l'OU Students et déplacer un utilisateur =====

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName

