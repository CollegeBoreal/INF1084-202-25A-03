$domainName = "dc300150433-00.local"

# Récupérer l'OU Students (crée-la avant si elle n'existe pas)
$studentsOU = Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -Server $domainName

# Récupérer Alice
$user = Get-ADUser -Identity "alice.dupont" -Server $domainName -Properties DistinguishedName

# Déplacer Alice dans Students
Move-ADObject -Identity $user.DistinguishedName -TargetPath $studentsOU.DistinguishedName -Server $domainName

# Vérifier
Get-ADUser -Identity "alice.dupont" -Server $domainName | Select Name, DistinguishedName
