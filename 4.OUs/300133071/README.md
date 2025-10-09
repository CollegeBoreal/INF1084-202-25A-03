je cree un utilisateur sur ma vm
New-ADUser `
  -Name "William Nelson" `
  -GivenName "William" `
  -Surname "Nelson" `
  -SamAccountName "nelson" `
  -UserPrincipalName "nelson@DC300133071-00.local" `
  -Path "CN=Users,DC=DC300133071-00,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Entrer le mot de passe") `
  -Enabled $true


Get-ADUser -Identity nelson : pour verifier

(Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections).fDenyTSConnections

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0

Add-ADGroupMember -Identity "Remote Desktop Users" -Members "wnelson"

Get-ADGroupMember "Remote Desktop Users"


Sur le serveur :

Ouvre secpol.msc (→ menu Démarrer → tape secpol.msc)

Va dans :
Local Policies → User Rights Assignment → Allow log on through Remote Desktop Services

Assure-toi que le groupe Remote Desktop Users (et/ou ton utilisateur) y figure.
