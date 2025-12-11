# Projet : Relation de Confiance entre Forêts Active Directory

**Auteur :** [Votre Nom]  
**Domaine :** `DC300141716-00.local`  
**Partenaire :** `DC300148450-00.local`  
**Date :** Décembre 2024

## 📋 Objectif
Établir et vérifier une relation de confiance bidirectionnelle entre deux forêts Active Directory distinctes en automatisant les procédures via PowerShell.

## 1. Préparation de l'Environnement
Installation des outils nécessaires pour gérer Active Directory en ligne de commande.

### Commandes Exécutées
```powershell
# Installation des modules PowerShell pour AD
Install-WindowsFeature RSAT-AD-PowerShell

# Installation des services de domaine
Install-WindowsFeature AD-Domain-Services

# Installation des outils d'administration AD
Install-WindowsFeature RSAT-ADDS
Install-WindowsFeature RSAT-AD-Tools

# Chargement du module ActiveDirectory
Import-Module ActiveDirectory
Résultat : Toutes les fonctionnalités ont été installées avec succès. Aucun redémarrage nécessaire.

2. Configuration des Prérequis Réseau
Avant de créer le trust, la connectivité réseau et DNS entre les deux domaines a été établie.

Résolution DNS
Configuration d'un Conditional Forwarder pour que chaque domaine puisse résoudre le nom de l'autre.

powershell
# Sur DC300141716-00.local (pointant vers l'IP du partenaire)
Add-DnsServerConditionalForwarderZone -Name "DC300148450-00.local" -MasterServers [IP_DU_SERVEUR_PARTENAIRE]
Validation :

powershell
# Test de résolution DNS
Resolve-DnsName DC300148450-00.local
# Test de connectivité réseau
Test-Connection -ComputerName DC300148450-00.local -Count 2
3. Création du Trust Inter-Forêts
Création de la relation de confiance à l'aide de la commande netdom.

Commande Principale
powershell
netdom trust DC300141716-00.local /Domain:DC300148450-00.local /UserD:administrator /PasswordD:* /Add /Realm /TwoWay
Note : Lors de l'exécution, une coquille a été corrigée automatiquement (/Twokay → /TwoWay).

Paramètres clés :

/Domain: : Spécifie le domaine partenaire.

/UserD: : Compte administrateur du domaine partenaire.

/PasswordD:* : Permet de saisir le mot de passe de manière sécurisée.

/Add : Ajoute un nouveau trust.

/Realm : Crée un trust de type "realm".

/TwoWay : Établit une confiance bidirectionnelle.

Sortie : The command completed successfully.

4. Vérification du Trust
4.1 Vérification par Interface Graphique
La console Active Directory Domains and Trusts (domain.msc) confirme la présence du trust des deux côtés :

Domains trusted by this domain : DC300141716-00.local → DC300148450-00.local

Domains that trust this domain : DC300148450-00.local → DC300141716-00.local

Type : realm

Transitive : No

4.2 Vérification par Ligne de Commande
powershell
# 1. Liste des domaines approuvés
nltest /trusted_domains

# 2. Détails du trust via PowerShell
Get-ADTrust -Filter * | Format-Table Name, Direction, TrustType, TrustStatus

# 3. Vérification spécifique du canal sécurisé
nltest /sc_verify:DC300148450-00.local
Tableau des Résultats de Vérification Attendus
Outil	Commande	Résultat Attendu
nltest	/trusted_domains	Liste incluant DC300148450-00.local (realm)
PowerShell	Get-ADTrust -Filter *	Affiche le trust avec Direction: Bidirectional, TrustType: Realm
nltest	/sc_verify	Retourne La confiance entre ... a été vérifiée avec succès.
5. Tests Fonctionnels
Accès aux Ressources du Domaine Partenaire
powershell
# Demande des identifiants administrateur du partenaire
$credPartenaire = Get-Credential -Message "Entrez les identifiants admin de DC300148450-00.local"

# Récupération d'informations sur le domaine partenaire
Get-ADDomain -Server DC300148450-00.local -Credential $credPartenaire

# Liste des utilisateurs du domaine partenaire (5 premiers)
Get-ADUser -Filter * -Server DC300148450-00.local -Credential $credPartenaire | Select-Object Name, SamAccountName -First 5
Navigation via PSDr
