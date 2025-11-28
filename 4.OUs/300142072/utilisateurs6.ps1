Import-Module ActiveDirectory

Enable-ADAccount -Identity "siga.diarra" -Credential $cred
