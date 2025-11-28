Import-Module ActiveDirectory

Remove-ADUser -Identity "siga.diarra" -Confirm:$false -Credential $cred

