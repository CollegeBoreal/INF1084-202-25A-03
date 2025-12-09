<# =========================================================
 utilisateurs3.ps1 – Activer RDP + accès groupe Students
 Domaine : DC300148450-00.local
========================================================= #>

# Charger bootstrap
. "$PSScriptRoot\..\..\4.OUs\300148450\bootstrap.ps1"

Import-Module ActiveDirectory

Write-Host "=== 1. Activation RDP ==="

Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" -Value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Host "RDP activé + firewall configuré."

Write-Host "=== 2. Vérification du groupe Students ==="

$GroupName = "Students"

if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'")) {
    New-ADGroup -Name $GroupName -GroupScope Global
    Write-Host "Groupe Students créé."
} else {
    Write-Host "Groupe Students déjà existant."
}

Write-Host "=== 3. Export de la stratégie locale ==="

$cfg = "C:\secpol.cfg"
$db  = "C:\secpol.sdb"

secedit /export /cfg $cfg | Out-Null

Write-Host "Fichier exporté → $cfg"
Write-Host "⚠️ Maintenant :"
Write-Host "  - Ouvre $cfg"
Write-Host "  - Trouve SeRemoteInteractiveLogonRight"
Write-Host "  - Ajoute : $netbiosName\Students"
Write-Host "  - Sauvegarde"
Write-Host ""

Read-Host "➡️ Appuie sur Entrée quand tu as modifié le fichier"

Write-Host "=== 4. Réimport de la stratégie ==="

secedit /import /cfg $cfg /db $db /overwrite | Out-Null

Write-Host "`n=== Script utilisateurs3.ps1 terminé avec succès ==="

