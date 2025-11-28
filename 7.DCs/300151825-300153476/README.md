📘 README — Projet : Création d’une relation de confiance entre deux forêts Active Directory
🎯 Objectif

Ce projet consiste à créer une relation de confiance (trust) bidirectionnelle entre deux forêts Active Directory distinctes, en utilisant uniquement des commandes PowerShell (CLI).
L’objectif est de permettre la communication sécurisée, la résolution DNS et l’accès aux ressources entre les deux forêts.

🏗️ 1. Informations sur la forêt AD1 (locale)

Commande utilisée :

Get-ADDomain


Résultat (extrait important) :

DNSRoot : DC300153476-00.local

NetBIOSName : DC300153476-00

DistinguishedName : DC=DC300153476-00,DC=local

Contrôleur de domaine : DC300153476.DC300153476-00.local

Mode de domaine : Windows2016Domain

🌐 2. Vérification DNS entre les deux forêts
Vérification via nom externe
ping netbios.featfreedy.xyz


✔️ Résolution fonctionnelle → IP : 10.7.236.217

Vérification via nom interne AD2
ping DC300151825-00.local


✔️ Résolution fonctionnelle et communication réussie

🛠️ 3. Script PowerShell complet (préparation + trust + verification)


###############################################################################
# SCRIPT COMPLET : Création d’une relation de confiance entre 2 forêts AD
###############################################################################

Write-Host "=== 1. PREPARATION DE LA CONNEXION ===" -ForegroundColor Cyan

# Demander les identifiants d'un administrateur de la forêt AD2
$credAD2 = Get-Credential -Message "Entrez le compte administrateur de la forêt AD2"


###############################################################################
# 2. Vérification DNS et connectivité entre AD1 et AD2
###############################################################################

Write-Host "=== 2. TEST DE CONNECTIVITE ===" -ForegroundColor Cyan

# Modifier le nom du DC de AD2 selon votre environnement
$AD2DC = "dc01.ad2.local"

# Vérifier si le DC AD2 répond au ping
Test-Connection -ComputerName $AD2DC -Count 2


###############################################################################
# 3. INTERROGER LE DOMAINE AD2
###############################################################################

Write-Host "=== 3. INTERROGATION DE AD2 ===" -ForegroundColor Cyan

# Informations générales de AD2
Get-ADDomain -Server $AD2DC -Credential $credAD2

# Lister les utilisateurs AD2
Get-ADUser -Filter * -Server $AD2DC -Credential $credAD2


###############################################################################
# 4. CREATION D'UN PSDRIVE POUR NAVIGUER DANS AD2
###############################################################################

Write-Host "=== 4. NAVIGATION DANS AD2 ===" -ForegroundColor Cyan

# Création du PSDrive
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root $AD2DC -Credential $credAD2 -ErrorAction SilentlyContinue

# Déplacement dans AD2
Set-Location AD2:\

# Affichage des OU
Get-ChildItem


###############################################################################
# 5. CREATION DE LA RELATION DE CONFIANCE (TRUST)
###############################################################################

Write-Host "=== 5. CREATION DU TRUST BIDIRECTIONNEL ===" -ForegroundColor Cyan

# Modifier la source et target forest selon votre configuration
$SourceForest = "DC300153476-00.local"
$TargetForest = "AD2.local"

New-ADForestTrust `
    -Name $TargetForest `
    -SourceForest $SourceForest `
    -TargetForest $TargetForest `
    -Credential $credAD2 `
    -Direction Bidirectional `
    -TrustType Forest `
    -TrustAttributes ForestTransitive


###############################################################################
# 6. VERIFICATION DU TRUST
###############################################################################

Write-Host "=== 6. VERIFICATION DU TRUST ===" -ForegroundColor Cyan

# Afficher tous les trusts existants
Get-ADTrust -Filter *

# Tester la relation de confiance
Test-ADTrustRelationship -Source $SourceForest -Target $TargetForest


Write-Host "=== TRUST CONFIGURE AVEC SUCCES ===" -ForegroundColor Green
###############################################################################
