Write-Host "Modification des utilisateurs..."

Set-ADUser "alice.dupont" -Description "Employée de test" 
Set-ADUser "marc.petit" -Department "Informatique" 

Set-ADAccountPassword "alice.dupont" `
  -NewPassword (ConvertTo-SecureString "NewPass123!" -AsPlainText -Force) `
  -Reset `
  
