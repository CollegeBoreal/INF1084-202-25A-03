###################################################
# Script : trusts2.ps1
# Rôle : Vérifier le trust et accéder au domaine A
# Domain B → Domain A
###################################################

Write-Host "=== Vérification Trust depuis Domain B ===" -ForegroundColor Cyan

# Variables à modifier si nécessaire
$RemoteDC = "DC300150416-00.local"    # Ton domaine
$RemoteServer = "DC300150416"         # Nom du contrôleur AD distant

# Identifiants du domaine distant (TON domaine)
$credA = Get-Credential -Message "Entrez les identifiants administrateur de $RemoteDC"

# Test réseau et DNS
Write-Host "=== Vérification de la connectivité ===" -ForegroundColor Yellow
Test-Connection -ComputerName $RemoteServer -Count 2

Write-Host "=== Vérification DNS ===" -ForegroundColor Yellow
nslookup $RemoteServer

# Informations du domaine local
Write-Host "=== Infos du domaine local ==="
Get-ADDomain

# Interroger le domaine distant (via Trust)
Write-Host "=== Infos du domaine distant ===" -ForegroundColor Green
Get-ADDomain -Server $RemoteDC -Credential $credA

Write-Host "=== Liste des utilisateurs du domaine distant ===" -ForegroundColor Green
Get-ADUser -Filter * -Server $RemoteDC -Credential $credA | Select SamAccountName, DistinguishedName

# Vérification du Trust
Write-Host "=== Vérification de la relation Trust ===" -ForegroundColor Yellow
Get-ADTrust -Filter *

Write-Host "=== Script terminé ===" -ForegroundColor Green

