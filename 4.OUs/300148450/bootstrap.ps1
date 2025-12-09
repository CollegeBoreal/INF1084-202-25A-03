<# =========================================================
 Script Bootstrap – Domaine de 300148450
========================================================= #>

# === Vos informations étudiant ===
$studentNumber   = 300148450
$studentInstance = "00"     # instance du domaine

# === Définition des noms de domaine ===
$domainName  = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

Write-Host "Bootstrap chargé : Domaine = $domainName, NetBIOS = $netbiosName"

# === Informations sécurisées (Mot de passe Administrateur du domaine) ===
$plain  = 'Infra@2024'     # <<< Mets ici TON mot de passe AD !
$secure = ConvertTo-SecureString $plain -AsPlainText -Force

# Credential du compte Administrator du domaine
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

