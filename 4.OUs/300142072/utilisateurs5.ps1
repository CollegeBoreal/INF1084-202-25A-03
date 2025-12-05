. .\bootstrap.ps1
Import-Module ActiveDirectory

Disable-ADAccount -Identity "alice.dupont" -Credential $cred
