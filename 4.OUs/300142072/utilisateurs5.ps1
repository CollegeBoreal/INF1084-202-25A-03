Import-Module ActiveDirectory

Disable-ADAccount -Identity "siga.diarra" -Credential $cred
