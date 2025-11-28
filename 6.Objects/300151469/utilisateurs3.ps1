# --- UT3 : Activer RDP + Donner accès RDP au groupe Students ---

# 1. Activer RDP
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" -Value 0

# 2. Autoriser RDP dans le firewall
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# 3. Donner le droit "Log on through Remote Desktop Services" au groupe Students

$group = "Students"
$cfgPath = "$env:TEMP\secpol.cfg"
$dbPath  = "$env:TEMP\secpol.sdb"

# Exporter la configuration actuelle
secedit /export /cfg $cfgPath /areas USER_RIGHTS | Out-Null

# Charger les lignes
$content = Get-Content $cfgPath

# Chercher la ligne
$matchLine = $content | Where-Object { $_ -match "^SeRemoteInteractiveLogonRight" }

if ($matchLine) {
    # Trouver l’index exact
    $lineIndex = $content.IndexOf($matchLine)

    # Ajouter Students si absent
    if ($matchLine -notmatch "\*$group") {
        $content[$lineIndex] = $matchLine + ",*$group"
    }
}
else {
    # La ligne n'existe pas → on la crée
    Add-Content -Path $cfgPath -Value "SeRemoteInteractiveLogonRight = *$group"
}

# Réécriture du fichier
$content | Set-Content $cfgPath

# Réimporter la stratégie mise à jour
secedit /configure /db $dbPath /cfg $cfgPath /areas USER_RIGHTS | Out-Null

Write-Host "UT3 terminé : RDP activé + accès donné au groupe '$group'."

