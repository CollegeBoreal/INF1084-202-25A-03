# 2 - Liste des utilisateurs du domaine de Karim

. "$PSScriptRoot\bootstrap.ps1"      # charge $domainName, $netbiosName, $cred
Import-Module ActiveDirectory        # charge le module AD

# Lister les utilisateurs actifs (sauf comptes système)
Get-ADUser -Filter * -Server $domainName -Properties Name, SamAccountName, Enabled |
  Where-Object {
    $_.Enabled -eq $true -and
    $_.SamAccountName -notin @("Administrator","Guest","krbtgt")
  } |
  Select-Object Name, SamAccountName, Enabled
