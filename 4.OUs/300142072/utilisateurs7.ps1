. .\bootstrap.ps1
Import-Module ActiveDirectory

Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

