# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$DC300147816,DC=local"
}

Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$DC300147816,DC=local" `
              -TargetPath "OU=Students,DC=$DC300147816,DC=local" `
              -Credential $cred

Get-ADUser -Identity "adupont" | Select-Object Name, DistinguishedName
