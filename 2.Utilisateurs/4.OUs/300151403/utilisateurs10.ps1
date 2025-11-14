1-Crée l’OU si elle n’existe pas :
# Vérifier si l'OU "Students" existe déjà
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'" -Server "$netbiosName.local" -Credential $cred)) {
    # Créer l'OU "Students"
    New-ADOrganizationalUnit -Name "Students" `
        -Path "DC=$netbiosName,DC=local" `
        -Server "$netbiosName.local" `
        -Credential $cred

    Write-Host "✅ OU 'Students' créée avec succès !"
} else {
    Write-Host "ℹ️ OU 'Students' existe déjà."
}

# 2️⃣ Déplacer l’utilisateur depuis CN=Users vers OU=Students
$sourcePath = "CN=Benoit Diallo,CN=Users,DC=$($netbiosName),DC=local"
$targetPath = "OU=Students,DC=$($netbiosName),DC=local"

Move-ADObject -Identity $sourcePath `
              -TargetPath $targetPath `
              -Server "$netbiosName.local" `
              -Credential $cred

Write-Host "✅ Utilisateur 'Benoit Diallo' déplacé vers l'OU 'Students' avec succès !"

# 3️⃣ Vérifier le déplacement
Get-ADUser -Identity "benoit.diallo" -Server "$netbiosName.local" |
Select-Object Name, DistinguishedName

