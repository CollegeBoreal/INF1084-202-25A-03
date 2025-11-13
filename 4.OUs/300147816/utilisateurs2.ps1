<<<<<<< HEAD
. "$PSScriptRoot\utilisateurs1.ps1" > $null

# Création des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}

# Ajouter les stagiaires dans GroupeFormation
$Groups["GroupeFormation"] += $Users[0]
$Groups["GroupeFormation"] += $Users[1]
$Groups["GroupeFormation"] += $Users[2]
$Groups["GroupeFormation"] += $Users[3]
$Groups["GroupeFormation"] += $Users[4]

# Afficher le contenu des groupes
foreach ($group in $Groups.Keys) {
    Write-Host "$group"
    $Groups[$group] | ForEach-Object { 
        Write-Host "$($_.Prenom) $($_.Nom) ($($_.Login))"
    }
    Write-Host ""
}
=======
# ===== utilisateurs2.ps1 : Lister et exporter les utilisateurs =====

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName

Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName

Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8

>>>>>>> c8fc1e6666a8b24b02fb49c7196da3d313e7cf38
