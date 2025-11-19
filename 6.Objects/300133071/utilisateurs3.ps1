. "C:\Users\Administrator\developer\INF1084-202-25A-03\4.OUs\300133071\bootstrap.ps1"
# Autoriser les connexions RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" -Value 0

# Autoriser RDP dans le firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
# Définir le groupe à autoriser
$group = "Students"
$cfgPath = "$env:TEMP\secpol.cfg"
$dbPath  = "$env:TEMP\secpol.sdb"

# Exporter la configuration actuelle
secedit /export /cfg $cfgPath /areas USER_RIGHTS | Out-Null

# Lire le fichier
$content = Get-Content $cfgPath

# Chercher la ligne actuelle (si elle existe)
$lineIndex = $content.IndexOf($content | Where-Object { $_ -match "^SeRemoteInteractiveLogonRight" })

if ($lineIndex -ge 0) {

    # Ligne existante
    $current = $content[$lineIndex]

    if ($current -notmatch $group) {
        # Ajouter le groupe au format *domain\group ou *group
        $updated = $current + ",*$group"
        $content[$lineIndex] = $updated
    }
}
else {
    # La ligne n’existe pas : on la crée
    Add-Content -Path $cfgPath -Value "SeRemoteInteractiveLogonRight = *$group"
}

# Réécrire le fichier mis à jour
$content | Set-Content $cfgPath

# Appliquer la nouvelle configuration
secedit /configure /db $dbPath /cfg $cfgPath /areas USER_RIGHTS | Out-Null

Write-Host "RDP activé et droits appliqués pour le groupe '$group'."
