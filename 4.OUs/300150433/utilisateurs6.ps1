# Vérifier si l'OU "Students" existe, sinon la créer
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -Server $domainName -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local" -Server $domainName
}

# Déplacer l'utilisateur Alice Dupont vers l'OU Students
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Server $domainName

# Vérifier que l'utilisateur a bien été déplacé
Get-ADUser -Identity "alice.dupont" -Server $domainName | Select-Object Name, DistinguishedName
