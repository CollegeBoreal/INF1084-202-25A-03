Import-Module ActiveDirectory

Set-ADUser -Identity "siga.diarra" `
           -EmailAddress "siga.diarra@example.com" `
           -GivenName "Siga-Aicha" `
           -Credential $cred
