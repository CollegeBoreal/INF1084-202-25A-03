# Projet : Relation de Confiance entre Forêts Active Directory

**Domaine : DC300141716-00.local**
**Partenaire : DC300148450-00.local**


---

## 📋 Objectif

Mettre en place et vérifier une **relation de confiance bidirectionnelle** entre deux forêts Active Directory distinctes en automatisant toutes les étapes via **PowerShell**.

---

## 1. Préparation de l'Environnement

Installation des outils nécessaires pour administrer Active Directory en ligne de commande.

### Commandes exécutées

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
```

**Résultat :** ✅ Toutes les fonctionnalités installées, aucun redémarrage nécessaire.

---
<img src=images/cap_projetfinal.png width='50%' height='50%'> </img>
## 2. Configuration DNS

Permettre aux deux domaines de se résoudre mutuellement.

### Sur mon serveur (DC300141716-00.local)

```powershell
Add-DnsServerConditionalForwarderZone -Name "DC300148450-00.local" -MasterServers [IP_DU_BINOME]
```

### Sur le serveur du partenaire (DC300148450-00.local)

Il a configuré un forwarder conditionnel vers mon domaine.

### Vérification

```powershell
nslookup DC300148450-00.local
Test-Connection -ComputerName DC300148450-00.local -Count 2
```

---

## 3. Création du Trust

Création de la relation de confiance bidirectionnelle entre les deux forêts.

```powershell
netdom trust DC300141716-00.local /Domain:DC300148450-00.local /UserD:administrator /PasswordD:* /Add /Realm /TwoWay
```

**Résultat :** ✅ *"The command completed successfully."*

> **Note :** L’option `/Realm` crée un trust de type **realm**, donc non-transitif.

---

## 4. Vérification du Trust

### 4.1 Vérification en ligne de commande

```powershell
# Liste des domaines de confiance
tltest /trusted_domains

# Détails complets du trust
Get-ADTrust -Filter *
```

**Résultats attendus :**

* `nltest` doit lister **DC300148450-00.local** (realm).
* `Get-ADTrust` doit montrer : *Bidirectional*, *Realm*, *TrustStatus OK*.

### 4.2 Vérification dans l’interface graphique

Ouvrir **Active Directory Domains and Trusts (domain.msc)**.

Ce qu'on doit voir :

* **Domains trusted by this domain :** DC300148450-00.local (Type: realm, Transitive: No)
* **Domains that trust this domain :** DC300141716-00.local (Type: realm, Transitive: No)

---

## 5. Tests Fonctionnels

Valider que la relation de confiance fonctionne réellement.

```powershell
# Saisir les identifiants du partenaire
$credPartenaire = Get-Credential -Message "Entrez les identifiants admin de DC300148450-00.local"

# Obtenir les informations du domaine partenaire
Get-ADDomain -Server DC300148450-00.local -Credential $credPartenaire

# Lister quelques utilisateurs du partenaire
Get-ADUser -Filter * -Server DC300148450-00.local -Credential $credPartenaire | Select-Object -First 3
```

---

## ✔️ Conclusion

La relation de confiance **realm bidirectionnelle** a été correctement configurée et validée via :

* DNS opérationnel entre les deux domaines
* Trust établi et vérifié en PowerShell et en GUI
* Tests fonctionnels réussis

Ce projet démontre la capacité à automatiser et diagnostiquer une configuration de trust entre deux forêts Active Directory.

<img src=images/trustpic.jpg width='50%' height='50%'> </img>
