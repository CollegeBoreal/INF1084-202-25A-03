. .\utilisateur3.ps1
Set-ADUser -Identity "rama.diallo" `
           -EmailAddress "rama.diallo@exemple.com" `
           -GivenName "Rama-Bah" `
           -Credential $cred
