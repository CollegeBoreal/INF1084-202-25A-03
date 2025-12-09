Write-Host "Modification des utilisateurs..." -ForegroundColor Cyan

Set-ADUser -Identity "alice.dupont" -Description "Employée de test"
Set-ADUser -Identity "marc.petit" -Department "Informatique"

Set-ADAccountPassword -Identity "alice.dupont" `
  -NewPassword (ConvertTo-SecureString "NewPass123!" -AsPlainText -Force) `
  -Reset
