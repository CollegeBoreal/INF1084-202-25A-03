# Demander les identifiants de l'administrateur de AD1
$credAD1 = Get-Credential -Message "Entrez le compte administrateur de AD1"

# Vérifier la connectivité réseau
Write-Host "Test de connexion vers AD1..." -ForegroundColor Cyan
Test-Connection -ComputerName DC300146418-00.local -Count 2

# Résolution DNS
Write-Host "Résolution DNS du domaine AD1..." -ForegroundColor Cyan
Resolve-DnsName DC300146418-00.local

# Créer le trust bidirectionnel vers AD1
Write-Host "Création du trust AD2 -> AD1..." -ForegroundColor Green
$netdomCmd = "netdom trust DC300146721_001.local DC300146418-00.local /UserO:$($credAD1.UserName) /PasswordO:* /Twoway /Confirm"
Invoke-Expression $netdomCmd

# Vérifier le trust
Write-Host "Vérification du trust..." -ForegroundColor Green
netdom trust DC300146721_001.local /domain:DC300146418-00.local /verify