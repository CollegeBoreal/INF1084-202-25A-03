# 3️⃣ Créer des utilisateurs

# --- Compte Leandre Ebah (Freedy) ---
New-ADUser `
  -Name "Leandre Ebah" `
  -GivenName "Leandre" `
  -Surname "Ebah" `
  -SamAccountName "leandre.ebah" `
  -UserPrincipalName "leandre.ebah@DC300152260-00.local" `
  -Path "CN=Users,DC=DC300152260-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrer le mot de passe pour Leandre Ebah" -AsSecureString) `
  -Enabled $true `
  -Credential $cred

# --- Compte Thomas Girard ---
New-ADUser `
  -Name "Thomas Girard" `
  -GivenName "Thomas" `
  -Surname "Girard" `
  -SamAccountName "thomas.girard" `
  -UserPrincipalName "thomas.girard@DC300152260-00.local" `
  -Path "CN=Users,DC=DC300152260-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrer le mot de passe pour Thomas Girard" -AsSecureString) `
  -Enabled $true `
  -Credential $cred
