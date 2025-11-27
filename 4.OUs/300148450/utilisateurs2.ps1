
Write-Host "Modification des utilisateurs..."

Set-ADUser "alice.dupont" -Description "Employée de test" -Credential $cred
Set-ADUser "marc.petit" -Department "Informatique" -Credential $cred

Set-ADAccountPassword "alice.dupont" `
  -NewPassword (ConvertTo-SecureString "NewPass123!" -AsPlainText -Force) `
  -Reset `
  -Credential $cred

