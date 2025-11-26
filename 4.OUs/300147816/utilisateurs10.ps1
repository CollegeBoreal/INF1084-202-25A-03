# Variables
$domain = "DC300147816"  # pas le NetBIOS
$cred = Get-Credential

# Vérifier si l'OU Students existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$domain,DC=local"
    Write-Host "OU 'Students' créée."
} else {
    Write-Host "OU 'Students' existe déjà."
}

# Déplacer l'utilisateur Alice Dupont
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$domain,DC=local" `
              -TargetPath "OU=Students,DC=$domain,DC=local" `
              -Credential $cred

Write-Host "Utilisateur déplacé."

# Vérifier le déplacement
Get-ADUser -Identity "adupont" | Select-Object Name, DistinguishedName

