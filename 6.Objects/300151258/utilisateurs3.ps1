Import-Module ActiveDirectory

$OU = "OU=Students,DC=DC300151258,DC=local"

# 1. Groupe Global Students
if (-not (Get-ADGroup -Filter "Name -eq 'Students'")) {
    New-ADGroup -Name "Students" -GroupScope Global -Path $OU
}

# 2. Ajouter le groupe Students dans Remote Desktop Users
try {
    Add-ADGroupMember -Identity "Remote Desktop Users" -Members "Students"
    Write-Host "Groupe Students ajouté au groupe Remote Desktop Users."
}
catch {
    Write-Host "ERREUR : $($_.Exception.Message)"
}

Write-Host "Script terminé."
