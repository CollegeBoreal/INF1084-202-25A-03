<#
===========================================================
 Script : Trust2.ps1
 Objet  : Étapes PowerShell pour interrogation du domaine
 Auteur : FeatFreedy
 Domaine local : DC300151825-00.local
 Domaine distant : DC300153476-00.local
===========================================================
#>

Write-Host "=== a. Définir les informations d’accès à AD2 ===" -ForegroundColor Cyan

# Demande des identifiants administrateur du domaine partenaire
$credAD2 = Get-Credential -Message "Entrez les identifiants administrateur du domaine DC300153476-00.local"



Write-Host "=== b. Vérifier la connectivité avec le DC de AD2 ===" -ForegroundColor Cyan

# Test de connectivité vers le contrôleur AD2
Test-Connection -ComputerName DC300153476-00.local -Count 2



Write-Host "=== c. Interroger le domaine AD2 ===" -ForegroundColor Cyan

# Informations générales du domaine AD2
Get-ADDomain -Server DC300153476-00.local -Credential $credAD2

# Liste des utilisateurs du domaine AD2
Get-ADUser -Filter * -Server DC300153476-00.local -Credential $credAD2



Write-Host "=== d. Naviguer dans AD2 via un PSDrive ===" -ForegroundColor Cyan

# Création du PSDrive AD2
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "DC300153476-00.local" -Credential $credAD2

# Se déplacer dans l'arborescence AD2
Set-Location AD2:\DC=DC300153476-00,DC=local

# Lister les objets dans AD2
Get-ChildItem



Write-Host "=== e. Création du trust entre les domaines ===" -ForegroundColor Cyan

# Création du trust Realm bidirectionnel
netdom TRUST DC300151825-00.local `
    /Domain:DC300153476-00.local `
    /UserO:Administrator `
    /PasswordO:* `
    /UserD:Administrator `
    /PasswordD:* `
    /Add `
    /Realm `
    /Twoway



Write-Host "=== f. Vérification du trust ===" -ForegroundColor Cyan

# Vérifier le trust
netdom trust DC300151825-00.local /Domain:DC300153476-00.local /Verify

# Vérifier DNS
Resolve-DnsName DC300153476-00.local

# Vérifier les trusts via NLTEST
nltest /domain_trusts


Write-Host "=== Script terminé ===" -ForegroundColor Green
