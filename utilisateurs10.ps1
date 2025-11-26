# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$DC300147816VM,DC=local"
}

Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$DC300147816VM,DC=local" `
              -TargetPath "OU=Students,DC=$DC300147816VM,DC=local" `
              -Credential $cred

Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName
