Import-Module ActiveDirectory

Disable-ADAccount -Identity "alice.dupont" -Credential $cred
