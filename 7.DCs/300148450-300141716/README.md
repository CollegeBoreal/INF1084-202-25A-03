Projet - Relation de confiance entre forêts Active Directory
Objectif du projet
Créer et vérifier une relation de confiance (trust) bidirectionnelle et transitive entre deux forêts Active Directory distinctes :

Forêt Locale : DC300141716-00.local

Forêt Partenaire : DC300148450-00.local

Travail entièrement automatisé via PowerShell.

Étape 1 – Préparation et vérification des prérequis
Vérification initiale de la connectivité
powershell
# Test DNS et réseau initial (devait échouer sans configuration)
Test-Connection -ComputerName DC300148450-00.local -Count 2
Configuration DNS (Conditional Forwarder)
Pour permettre la résolution de noms entre les forêts, un redirecteur conditionnel a été configuré.

Commande exécutée :

powershell
# Configuration du redirecteur conditionnel vers le DNS du partenaire
Add-DnsServerConditionalForwarderZone -Name "DC300148450-00.local" -MasterServers [IP_DU_SERVEUR_DNS_DU_BINOME]
Remarque : [IP_DU_SERVEUR_DNS_DU_BINOME] doit être remplacée par l'adresse IP du contrôleur de domaine de ton binôme.

Vérification post-configuration :

powershell
# Test DNS avec nslookup
nslookup DC300148450-00.local

# Test de connectivité réseau
Test-Connection -ComputerName DC300148450-00.local -Count 2
<table> <tr> <td><b>Avant la configuration DNS</b><br><img src="images/dns_echec.png" alt="Échec de résolution DNS"></td> <td><b>Après la configuration DNS</b><br><img src="images/dns_succes.png" alt="Résolution DNS réussie"></td> </tr> </table>
Étape 2 – Création du Trust
Commande d'automatisation principale
Le trust a été créé en utilisant la commande netdom avec authentification.

powershell
# Création du trust bidirectionnel
netdom trust DC300141716-00.local /Domain:DC300148450-00.local /UserD:administrator /PasswordD:* /Add /Realm /TwoWay
Analyse technique :
La commande a utilisé le paramètre /Realm, ce qui a créé un trust de type "realm" qui est par défaut non-transitif. Ce type de trust est généralement utilisé pour l'interopérabilité avec des domaines Kerberos non-Windows.

Pour créer un "forest trust" transitif comme spécifié initialement dans les objectifs du projet, il aurait fallu :

Omettre le paramètre /Realm

Ajouter explicitement /Transitive:YES

S'assurer que les deux domaines sont des forêts Active Directory Windows

Étape 3 – Vérification du Trust
Vérification par interface graphique (Active Directory Domains and Trusts)
La console domain.msc confirme la création du trust dans les deux sens.

<img src="images/trust_gui.png" alt="Vue du trust dans Active Directory Domains and Trusts" width="600">
Vérification par ligne de commande
Plusieurs outils CLI permettent de vérifier l'état du trust.

powershell
# 1. Liste des domaines approuvés avec nltest
nltest /trusted_domains

# 2. Détails complets du trust via PowerShell
Get-ADTrust -Filter * | Format-Table Name, Direction, TrustType, TrustStatus
<table> <tr> <td><b>Sortie de nltest</b><br><img src="images/nltest_result.png" alt="Résultat de nltest /trusted_domains" width="400"></td> <td><b>Sortie de Get-ADTrust</b><br><img src="images/get-adtrust_result.png" alt="Résultat de Get-ADTrust" width="500"></td> </tr> </table>
Vérification de la relation de confiance spécifique
powershell
# Vérification détaillée d'un trust spécifique
nltest /sc_verify:DC300148450-00.local

# Requête d'informations de confiance
nltest /query_trust
Étape 4 – Tests fonctionnels inter-domaines
Authentification et accès aux informations du domaine partenaire
powershell
# Saisie sécurisée des identifiants d'administration du domaine partenaire
$credPartenaire = Get-Credential -Message "Entrez les identifiants administrateur de DC300148450-00.local"

# Récupération des informations générales du domaine partenaire
Get-ADDomain -Server DC300148450-00.local -Credential $credPartenaire

# Liste des utilisateurs du domaine partenaire (premiers 5 résultats)
Get-ADUser -Filter * -Server DC300148450-00.local -Credential $credPartenaire | Select-Object Name, SamAccountName -First 5

# Test d'accès aux Unités d'Organisation
Get-ADOrganizationalUnit -Filter * -Server DC300148450-00.local -Credential $credPartenaire | Select-Object Name -First 3
<img src="images/get-addomain_result.png" alt="Résultat de Get-ADDomain" width="700">
Navigation avancée via PSDrive
powershell
# Création d'un lecteur PowerShell pour naviguer dans l'AD du partenaire
New-PSDrive -Name "ADPartner" -PSProvider ActiveDirectory -Root "" -Server DC300148450-00.local -Credential $credPartenaire

# Navigation et exploration de la structure
cd ADPartner:
Get-ChildItem
Get-ChildItem -Path "OU=Domain Controllers" -Server DC300148450-00.local -Credential $credPartenaire
Test d'authentification croisée
powershell
# Tentative d'authentification avec un compte du domaine partenaire
$securePass = ConvertTo-SecureString "MotDePasse" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("DC300148450-00\UtilisateurTest", $securePass)

# Test d'accès à une ressource (exemple)
Test-Connection -ComputerName DC300148450-00.local -Credential $cred -Count 1
Étape 5 – Script d'automatisation complet
Un script PowerShell unifié a été créé pour automatiser toutes les étapes.

Nom du script : Create-Verify-ForestTrust.ps1

powershell
<#
.SYNOPSIS
    Automatise la création et la vérification d'un trust entre forêts AD.
.DESCRIPTION
    Ce script configure DNS, crée le trust, et exécute tous les tests.
.PARAMETER PartnerDomain
    Nom de domaine du partenaire (ex: DC300148450-00.local)
.PARAMETER PartnerDNSIP
    Adresse IP du serveur DNS du partenaire
#>

param(
    [string]$PartnerDomain = "DC300148450-00.local",
    [string]$PartnerDNSIP = "192.168.1.100"
)

# Section 1: Configuration DNS
Write-Host "1. Configuration des redirecteurs conditionnels DNS..." -ForegroundColor Cyan
Add-DnsServerConditionalForwarderZone -Name $PartnerDomain -MasterServers $PartnerDNSIP

# Section 2: Création du trust
Write-Host "2. Création du trust..." -ForegroundColor Cyan
netdom trust DC300141716-00.local /Domain:$PartnerDomain /UserD:administrator /PasswordD:* /Add /TwoWay

# Section 3: Vérifications
Write-Host "3. Vérification du trust..." -ForegroundColor Cyan
nltest /trusted_domains
Get-ADTrust -Filter *

Write-Host "Opération terminée!" -ForegroundColor Green
Étape 6 – Dépannage et problèmes rencontrés
Problème 1 : Échec de résolution DNS
Symptôme : Test-Connection retourne "No such host is known"
Solution : Configuration des Conditional Forwarders comme décrit à l'Étape 1.

Problème 2 : Échec d'authentification lors de la création du trust
Symptôme : netdom échoue avec des erreurs d'authentification
Solution : Vérifier que :

Les identifiants administrateur du domaine partenaire sont corrects

Le compte a les privilèges nécessaires (Domain Admins ou Enterprise Admins)

Aucun pare-feu ne bloque les ports d'authentification (ports 88, 135, 139, 389, 445, 464, 636)

Problème 3 : Trust visible mais non fonctionnel
Symptôme : Le trust apparaît dans domain.msc mais les requêtes inter-domaines échouent
Solution : Exécuter nltest /sc_verify:DC300148450-00.local pour vérifier l'état du canal sécurisé.

