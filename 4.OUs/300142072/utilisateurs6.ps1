. .\bootstrap.ps1
Import-Module ActiveDirectory

Enable-ADAccount -Identity "alice.dupont" -Credential $cred
