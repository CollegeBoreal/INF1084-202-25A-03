<<<<<<< HEAD:4.OUs/300148450/utilisateurs3.ps1
# utilisateurs3.ps1
. .\bootstrap.ps1

Write-Host "Désactivation d'utilisateurs..." -ForegroundColor Cyan
Disable-ADAccount -Identity "alice.dupont" -Credential $cred

Write-Host "Réactivation d'utilisateurs..." -ForegroundColor Cyan
Enable-ADAccount -Identity "alice.dupont" -Credential $cred
=======
. .\bootstrap.ps1
Import-Module ActiveDirectory
>>>>>>> 527495765984952f9723a6557b47a9b359ab761b:4.OUs/300142072/utilisateurs3.ps1

