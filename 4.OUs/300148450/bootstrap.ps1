# ============================================================
#  Bootstrap.ps1
#  Informations de l'étudiant et crédentials
# ============================================================

# Vos informations
$studentNumber   = 300148450
$studentInstance = "00"

# Noms du domaine
$domainName  = "DC$studentNumber-$studentInstance.local"      # DC300148450-00.local
$netbiosName = "DC$studentNumber-$studentInstance"            # DC300148450-00

# Mot de passe Admin
$plain  = "Infra@2024"
$secure = ConvertTo-SecureString $plain -AsPlainText -Force

# Credentials Admin
$cred = New-Object System.Management.Automation.PSCredential(
    "Administrator@$domainName",
    $secure
)

Write-Host "Bootstrap chargé : Domaine = $domainName, NetBIOS = $netbiosName"

