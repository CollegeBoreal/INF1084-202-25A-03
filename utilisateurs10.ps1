$netbiosName = "DC300147816"

# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

# Déplacer l'utilisateur
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local"

# Vérifier le déplacement - CORRECTION : utiliser "adupont" 
Get-ADUser -Identity "adupont" | Select-Object Name, DistinguishedName
