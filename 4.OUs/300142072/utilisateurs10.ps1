Import-Module ActiveDirectory

$studentNumber = 300142072
$studentInstance = 20
$netbiosName = "DC$studentNumber-$studentInstance"

# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
}

# Déplacement
Move-ADObject -Identity "CN=Siga Diarra,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred
