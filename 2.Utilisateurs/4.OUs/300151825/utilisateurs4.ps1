# 4️⃣ Modifier un utilisateur

Set-ADUser -Identity "leandre.ebah" `
           -EmailAddress "leandre.ebah@DC300151825-00.local" `
           -GivenName "Leandre-Freedy" `
           -Credential $cred
