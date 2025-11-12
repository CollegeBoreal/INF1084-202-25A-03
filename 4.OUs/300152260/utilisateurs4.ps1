# 4️⃣ Modifier un utilisateur

Set-ADUser -Identity "leandre.ebah" `
           -EmailAddress "leandre.ebah@DC300152260-00.local" `
           -GivenName "Leandre-Freedy" `
           -Credential $cred
