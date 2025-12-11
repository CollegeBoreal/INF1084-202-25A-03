Import-Module ActiveDirectory

Write-Host "Activation RDP..."

# 1️⃣ Activer RDP sur le serveur
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
-Name "fDenyTSConnections" -Value 0
Write-Host "✔ RDP activé"

# 2️⃣ Autoriser RDP dans le firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Write-Host "✔ Firewall RDP OK"

# 3️⃣ Ajouter Students dans le groupe AD "Remote Desktop Users"
Add-ADGroupMember -Identity "Remote Desktop Users" -Members "Students" -ErrorAction SilentlyContinue
Write-Host "✔ Groupe Students autorisé pour RDP"

# 4️⃣ Mise à jour des stratégies
gpupdate /force | Out-Null
Write-Host "🎯 Configuration RDP terminée ✔"
