# ===================================================
# Script PowerShell pour créer et vérifier un trust
# entre deux forêts Active Directory
# Respecte les directives du projet INF1084
# ===================================================

# Étape 0 : Message de début
Write-Host "=== Début du script de création et vérification du trust ===" -ForegroundColor Cyan

# Étape 1 : Demander les identifiants administrateur de la forêt distante (AD2)
$credAD2 = Get-Credential -Message "Entrez le compte administrateur de AD2"

# Étape 2 : Vérifier la connectivité au contrôleur de domaine AD2
$dcAD2 = "dc01.ad2.local"   # Nom du contrôleur de domaine AD2
Write-Host "Test de connectivité vers $dcAD2..." -ForegroundColor Yellow
Test-Connection -ComputerName $dcAD2 -Count 2

# Étape 3 : Créer le trust bidirectionnel et transitif
$sourceForest = "AD1.local"  # Nom de ta forêt
$targetForest = "AD2.local"  # Nom de la forêt distante

Write-Host "Création du trust bidirectionnel entre $sourceForest et $targetForest..." -ForegroundColor Yellow
New-ADTrust -Name $targetForest `
            -SourceForest $sourceForest `
            -TargetForest $targetForest `
            -Credential $credAD2 `
            -TrustType Forest `
            -Direction Bidirectional `
            -Transitive $true

# Étape 4 : Vérifier le trust
Write-Host "Vérification du trust..." -ForegroundColor Yellow
Get-ADTrust -Filter * -Server $dcAD2 -Credential $credAD2

# Étape 5 : Lister les utilisateurs de AD2 pour tester l’accès
Write-Host "Liste des utilisateurs de AD2..." -ForegroundColor Yellow
Get-ADUser -Filter * -Server $dcAD2 -Credential $credAD2

# Étape 6 : Créer un PSDrive pour accéder à AD2
Write-Host "Création d'un PSDrive pour naviguer dans AD2..." -ForegroundColor Yellow
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root $dcAD2 -Credential $credAD2

# Étape 7 : Navigation et affichage des unités organisationnelles
Write-Host "Navigation dans AD2 et liste des unités organisationnelles..." -ForegroundColor Yellow
Set-Location AD2:\DC=AD2,DC=LOCAL
Get-ChildItem

# Étape 8 : Fin du script
Write-Host "=== Script terminé : le trust a été créé et vérifié ===" -ForegroundColor Cyan
