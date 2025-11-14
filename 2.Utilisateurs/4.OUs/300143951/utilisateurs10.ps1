# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

Move-ADObject -Identity "CN=K falcon,CN=Users,DC=DC300143951-00,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

Get-ADUser -Identity "Kadji.falcon" | Select-Object Name, DistinguishedName
