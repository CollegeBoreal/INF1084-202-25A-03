# Activer les connexions Bureau à distance (RDP) sur la machine
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Autoriser les règles du pare-feu Windows nécessaires pour le RDP
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Accorder le droit de connexion via RDP au groupe "Students"
secedit /export /cfg C:\secpol.cfg
# Modifier le fichier de stratégie locale (C:\secpol.cfg) pour ajouter "Students" à la stratégie "SeRemoteInteractiveLogonRight"
# Réimporter la configuration modifiée pour appliquer les changements
secedit /import /cfg C:\secpol.cfg /db C:\secpol.sdb /overwrite

