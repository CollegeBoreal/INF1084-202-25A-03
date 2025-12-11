Import-Module ActiveDirectory

# Mise à jour de l'utilisateur Alice Dupont
Set-ADUser -Identity "alice.dupont" `
    -EmailAddress "alice.dupont@DC300151556-00.local" `
    -GivenName "Alice-Marie"
