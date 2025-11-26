
# Variables
$netbiosName = "DC300147816VM"
$cred = Get-Credential

# Vérifier si l'OU Students existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local"
    Write-Host "OU 'Students' créée."
} else {
    Write-Host "OU 'Students' existe déjà."
}

# Déplacer l'utilisateur Alice Dupont
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

Write-Host "Utilisateur déplacé."

# Vérifier le déplacement
Get-ADUser -Identity "adupont" | Select-Object Name, DistinguishedName

