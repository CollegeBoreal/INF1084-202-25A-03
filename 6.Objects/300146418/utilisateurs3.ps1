# Activer RDP sur la machine
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Activer la règle du pare-feu pour le Bureau à distance
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Définir le groupe à autoriser
$Group = "Students"

# Vérifier si le groupe existe localement ou dans le domaine
try {
    $GroupSID = (Get-ADGroup $Group -ErrorAction Stop).SID
} catch {
    $GroupSID = (Get-LocalGroup $Group -ErrorAction SilentlyContinue).SID
}

if (-not $GroupSID) {
    Write-Host "Le groupe '$Group' n'existe pas localement ou dans le domaine." -ForegroundColor Red
    exit
}

# Récupérer les droits actuels de connexion à distance
$PolicyKey = "HKLM:\System\CurrentControlSet\Control\Terminal Server\UserRights"
if (-not (Test-Path $PolicyKey)) {
    New-Item -Path $PolicyKey | Out-Null
}

# Vérifier les utilisateurs déjà autorisés pour le droit RDP
$CurrentValue = (secedit /export /cfg "$env:TEMP\secpol.cfg" | Out-Null; 
(Get-Content "$env:TEMP\secpol.cfg") -match "SeRemoteInteractiveLogonRight").Trim()

# Ajouter le groupe Students s’il n’est pas déjà présent
if ($CurrentValue -notmatch $Group) {
    $TempFile = "$env:TEMP\secpol.cfg"
    (Get-Content $TempFile) | ForEach-Object {
        if ($_ -match "^SeRemoteInteractiveLogonRight") {
            if ($_ -notmatch $Group) {
                $_ = $_ + ",*$Group"
            }
        }
        $_
    } | Set-Content $TempFile -Encoding ASCII

    # Réimporter la politique de sécurité mise à jour
    secedit /import /cfg $TempFile /db "$env:TEMP\secpol.sdb" /overwrite
    secedit /configure /db "$env:TEMP\secpol.sdb" /cfg $TempFile /areas USER_RIGHTS
    gpupdate /force
}

Write-Host "RDP activé et groupe '$Group' ajouté aux autorisations." -ForegroundColor Grn

