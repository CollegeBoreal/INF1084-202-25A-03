# Demander les identifiants Admin du domaine d'Amel
$cred = Get-Credential -Message "Entrez le compte Administrator du domaine DC300150195-00.local"

Write-Host "=== 1. Résolution DNS ==="
Resolve-DnsName DC300150195-00.local
Resolve-DnsName DC300150195.DC300150195-00.local -ErrorAction SilentlyContinue

Write-Host "=== 2. Test de connectivité ==="
Test-Connection -ComputerName DC300150195-00.local -Count 2
Test-Connection -ComputerName 10.7.236.211 -Count 2

Write-Host "=== 3. Informations AD du domaine d'Amel ==="
Get-ADDomain -Server DC300150195-00.local -Credential $cred

Write-Host "=== 4. Exemple : lister des utilisateurs ==="
Get-ADUser -Filter * -Server DC300150195-00.local -Credential $cred | Select -First 5

Write-Host "=== 5. Création du trust bidirectionnel ==="

netdom trust DC300150195-00.local `
    /Domain:DC300151347-00.local `
    /UserD:Administrator `
    /PasswordD:* `
    /Add `
    /TwoWay

Write-Host "=== Trust créé ==="

