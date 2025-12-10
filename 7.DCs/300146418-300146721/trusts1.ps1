
<#
Script : create-trust-ad2.ps1
Exécuter sur : AD2 (10.7.236.204)
Forest : DC300146418-00.local
Trust vers : DC300146721_001.local
#>

Import-Module ActiveDirectory

$LocalForest  = "DC300146418-00.local"
$TargetForest = "DC300146721_001.local"

Write-Host "=== TRUST : COTE AD2 ===" -ForegroundColor Cyan

$credAD2 = Get-Credential -Message "Identifiants Admin de AD2"
$credAD1 = Get-Credential -Message "Identifiants Admin de AD1"

Write-Host "Vérification connectivité vers AD1..." -ForegroundColor Yellow
Test-Connection 10.7.236.206 -Count 2

Write-Host "Création du trust (côté AD2)..." -ForegroundColor Cyan

New-ADTrust `
    -Name $TargetForest `
    -TargetName $TargetForest `
    -TrustType Forest `
    -Direction Bidirectional `
    -Authentication Forest `
    -Confirm:$false

Write-Host "Trust créé (côté AD2)" -ForegroundColor Green

Write-Host "Listing du trust :" -ForegroundColor Yellow
Get-ADTrust -Filter * | Format-List
