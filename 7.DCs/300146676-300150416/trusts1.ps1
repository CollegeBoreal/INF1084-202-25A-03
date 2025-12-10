##############################################
# Script : trusts.ps1
# Rôle : Créer un trust entre deux domaines AD
# Domain A → Domain B
##############################################

Write-Host "=== Script de création de Trust (Domain A) ===" -ForegroundColor Cyan

# Variables à modifier si nécessaire
$LocalDomain = "DC300150416-00.local"         # Domaine local (TON domaine)
$RemoteDomain = "DC300146676-00.local"        # Domaine distant (domaine de ton ami)

# Demande des identifiants d’un administrateur du domaine distant
$cred = Get-Credential -Message "Entrez les identifiants admin de $RemoteDomain"

# Test ping du domaine distant
Write-Host "=== Vérification de la connectivité ===" -ForegroundColor Yellow
Test-Connection -ComputerName $RemoteDomain -Count 2

# Création du Trust (Bidirectionnel / Non-Transitif / Realm)
Write-Host "=== Création du Trust ===" -ForegroundColor Green
netdom trust $RemoteDomain /Domain:$LocalDomain /UserD:$($cred.Username) /PasswordD:$($cred.GetNetworkCredential().Password) /Add /Realm /TwoWay

# Vérification du Trust après création
Write-Host "=== Vérification du Trust via PowerShell ===" -ForegroundColor Yellow
Get-ADTrust -Filter *
Write-Host "=== Vérification terminée ===" -ForegroundColor Green

