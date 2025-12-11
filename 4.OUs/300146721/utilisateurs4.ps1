# ================================
# bootstrap.ps1 - Smail Ikhlef (300146721)
# Domaine: DC300146721_001.local
# ================================

# Vérifier si l'OU "Students" existe, sinon la créer
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -Server $domainName -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local" -Server $domainName
}

# Déplacer l'utilisateur "Alice Dupont" vers l'OU "Students"
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Server $domainName

# Vérifier le déplacement
Get-ADUser -Identity "alice.dupont" -Server $domainName | Select-Object Name, DistinguishedName