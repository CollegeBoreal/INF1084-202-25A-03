Import-Module ActiveDirectory

Enable-ADAccount -Identity "alice.dupont" -Credential $cred
