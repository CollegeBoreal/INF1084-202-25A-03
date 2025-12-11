# Demander les identifiants de l'administrateur de AD2
$credAD2 = Get-Credential -Message "Entrez le compte administrateur de AD2"

# Vérifier la connectivité réseau
Write-Host "Test de connexion vers AD2..." -ForegroundColor Cyan
Test-Connection -ComputerName DC300146721_001.local -Count 2

# Résolution DNS
Write-Host "Résolution DNS du domaine AD2..." -ForegroundColor Cyan
Resolve-DnsName DC300146721_001.local

# Créer le trust bidirectionnel vers AD2
Write-Host "Création du trust AD1 -> AD2..." -ForegroundColor Green
$netdomCmd = "netdom trust DC300146418-00.local DC300146721_001.local /UserO:$($credAD2.UserName) /PasswordO:* /Twoway /Confirm"
Invoke-Expression $netdomCmd

# Vérifier le trust
Write-Host "Vérification du trust..." -ForegroundColor Green
netdom trust DC300146418-00.local /domain:DC300146721_001.local /verify

