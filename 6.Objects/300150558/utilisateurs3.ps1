Import-Module ActiveDirectory

Write-Host "=== Étape 3 : Activer RDP pour le groupe Students ===" -ForegroundColor Cyan

# 0) Infos domaine
$domain      = Get-ADDomain
$netbiosName = $domain.NetBIOSName        # ex : DC300150558-00
$domainDN    = $domain.DistinguishedName  # ex : DC=DC300150558-00,DC=local

# 1) Autoriser les connexions RDP sur le serveur
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" `
                 -Name "fDenyTSConnections" `
                 -Value 0
Write-Host "[OK] Connexions RDP autorisées (fDenyTSConnections = 0)." -ForegroundColor Green

# 2) Activer le firewall pour Remote Desktop
Enable-NetFirewallRule -DisplayGroup "Remote Desktop" | Out-Null
Write-Host "[OK] Règles de firewall 'Remote Desktop' activées." -ForegroundColor Green

# 3) Vérifier / créer le groupe Students dans AD
$GroupName = "Students"
$adGroup   = Get-ADGroup -Filter "SamAccountName -eq '$GroupName'" -ErrorAction SilentlyContinue

if (-not $adGroup) {
    $adGroup = New-ADGroup `
        -Name $GroupName `
        -SamAccountName $GroupName `
        -GroupScope Global `
        -GroupCategory Security `
        -Description "Users allowed RDP and shared folder access"
    Write-Host "[OK] Groupe $GroupName créé : $($adGroup.DistinguishedName)" -ForegroundColor Green
} else {
    Write-Host "[!] Groupe $GroupName existe déjà : $($adGroup.DistinguishedName)" -ForegroundColor Yellow
}

# 4) Ajouter le groupe Students au groupe intégré "Remote Desktop Users" (dans Builtin)
$builtinDN = "CN=Builtin,$domainDN"

# On gère à la fois anglais et français, au cas où le DC est francisé
$rdpGroup = Get-ADGroup -LDAPFilter "(|(cn=Remote Desktop Users)(cn=Utilisateurs du Bureau à distance))" `
                        -SearchBase $builtinDN `
                        -ErrorAction SilentlyContinue

if (-not $rdpGroup) {
    Write-Host "[ERREUR] Impossible de trouver le groupe intégré 'Remote Desktop Users' dans CN=Builtin,$domainDN." -ForegroundColor Red
    Write-Host "        Vérifie dans ADUC (Utilisateurs et ordinateurs Active Directory) sous le conteneur Builtin." -ForegroundColor Red
}
else {
    try {
        Add-ADGroupMember -Identity $rdpGroup.DistinguishedName -Members $GroupName -ErrorAction Stop
        Write-Host "[OK] Groupe $GroupName ajouté au groupe intégré '$($rdpGroup.Name)'." -ForegroundColor Green
    }
    catch {
        Write-Host "[ERREUR] Impossible d'ajouter $GroupName à '$($rdpGroup.Name)' : $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "=== Fin de utilisateurs3.ps1 ===" -ForegroundColor Cyan

