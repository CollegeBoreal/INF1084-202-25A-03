. ./bootstrap.ps1
Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred

