*Ramatoulaye Diallo: 300153476*
************************************************************************************************************************************************
# 🏛️ Installation et Configuration d’un Domaine Active Directory

### 📘 Laboratoire – Windows Server 2022

**Auteur :** Ramatoulaye Diallo
**Date :** Novembre 2025
**Domaine créé :** `DC300153476-00.local`
**Contrôleur de domaine (DC) :** `DC300153476.DC300153476-00.local`

---

## 🌐 1️⃣ Présentation générale

Ce projet illustre la **création complète d’un domaine Active Directory (AD DS)** avec **DNS intégré** sur **Windows Server 2022**.
L’objectif est de comprendre la structure hiérarchique d’Active Directory, les objets qu’il contient, ainsi que la configuration initiale d’un **contrôleur de domaine** (DC).

---

## 🧩 2️⃣ Rappel du cours – Concepts clés d’Active Directory

| Élément                            | Description                                                                      | Exemple                               |
| ---------------------------------- | -------------------------------------------------------------------------------- | ------------------------------------- |
| 🌳 **Forêt (Forest)**              | Ensemble de domaines partageant le même schéma et catalogue global.              | `DC300153476-00.local`                |
| 🌲 **Arbre (Tree)**                | Ensemble de domaines liés hiérarchiquement.                                      | `hr.DC300153476-00.local` (exemple)   |
| 🌐 **Domaine (Domain)**            | Unité d’administration principale regroupant utilisateurs, ordinateurs, groupes. | `DC300153476-00.local`                |
| 🗂️ **OU (Unité d’organisation)**  | Structure logique pour organiser les objets.                                     | `OU=Comptes,OU=Informatique`          |
| 🏛️ **Contrôleur de domaine (DC)** | Serveur qui héberge AD DS et gère l’authentification.                            | `DC300153476.DC300153476-00.local`    |
| 🧭 **DNS**                         | Système de résolution de noms indispensable à AD.                                | `DC300153476-00.local` → IP du DC     |
| ⚙️ **GPO (Group Policy Object)**   | Définit les politiques de sécurité et de configuration.                          | `Default Domain Policy`               |
| 🔐 **Kerberos / LDAP**             | Protocoles utilisés pour l’authentification et les requêtes AD.                  | Kerberos = sécurité, LDAP = recherche |

---

## 🖥️ 3️⃣ Étapes d’installation (PowerShell)

### ⚙️ 1. Renommer le serveur

```powershell
Rename-Computer -NewName "DC300153476" -Restart
```

### ⚙️ 2. Installer le rôle Active Directory Domain Services

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

### ⚙️ 3. Créer une nouvelle forêt et domaine

```powershell
Install-ADDSForest `
  -DomainName "DC300153476-00.local" `
  -DomainNetbiosName "DC300153476-00" `
  -InstallDns:$true `
  -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
  -Force
```

✅ Le serveur redémarre automatiquement après la promotion en **contrôleur de domaine**.

---

## 🔍 4️⃣ Vérification de l’installation

### 📄 Résultat de `Get-ADDomain`

```
AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300153476-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300153476-00,DC=local
DistinguishedName                  : DC=DC300153476-00,DC=local
DNSRoot                            : DC300153476-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300153476-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300153476-00,DC=local
Forest                             : DC300153476-00.local
InfrastructureMaster               : DC300153476.DC300153476-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300153476-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300153476-00,DC=local
ManagedBy                          :
Name                               : DC300153476-00
NetBIOSName                        : DC300153476-00
ObjectClass                        : domainDNS
ObjectGUID                         : 6e025027-fa10-4753-b3be-04c0c8d96df3
ParentDomain                       :
PDCEmulator                        : DC300153476.DC300153476-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300153476-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300153476.DC300153476-00.local}
RIDMaster                          : DC300153476.DC300153476-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300153476-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300153476-00,DC=local,
                                     CN=Configuration,DC=DC300153476-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300153476-00,DC=local
UsersContainer                     : CN=Users,DC=DC300153476-00,DC=local
```

📘 **Interprétation :**

* Domaine bien créé : `DC300153476-00.local`
* Mode de domaine : `Windows2016Domain`
* Contrôleur de domaine actif : `DC300153476.DC300153476-00.local`
* Tous les rôles FSMO (PDC, RID, Infrastructure) sont attribués à ce DC
  ✅ **Domaine fonctionnel et opérationnel**

---

### 📄 Résultat de `Get-ADForest`

```
ApplicationPartitions : {DC=DomainDnsZones,DC=DC300153476-00,DC=local, DC=ForestDnsZones,DC=DC300153476-00,DC=local}
CrossForestReferences : {}
DomainNamingMaster    : DC300153476.DC300153476-00.local
Domains               : {DC300153476-00.local}
ForestMode            : Windows2016Forest
GlobalCatalogs        : {DC300153476.DC300153476-00.local}
Name                  : DC300153476-00.local
PartitionsContainer   : CN=Partitions,CN=Configuration,DC=DC300153476-00,DC=local
RootDomain            : DC300153476-00.local
SchemaMaster          : DC300153476.DC300153476-00.local
Sites                 : {Default-First-Site-Name}
SPNSuffixes           : {}
UPNSuffixes           : {}

```

📘 **Interprétation :**

* Forêt unique : `DC300153476-00.local`
* Niveau fonctionnel : `Windows2016Forest`
* Contrôleur de domaine héberge le **catalogue global**
* Rôles de **SchemaMaster** et **DomainNamingMaster** bien installés
  ✅ **Forêt AD configurée avec succès**

---

## 🧠 5️⃣ En résumé

| Élément                  | État               |
| ------------------------ | ------------------ |
| Domaine AD               | ✅ Créé avec succès |
| Forêt AD                 | ✅ Initialisée      |
| Contrôleur de domaine    | ✅ Fonctionnel      |
| DNS intégré              | ✅ Configuré        |
| Catalogue global         | ✅ Activé           |
| GPO par défaut           | ✅ Appliquée        |
| Services Kerberos / LDAP | ✅ Opérationnels    |

---

## 🧭 6️⃣ Commandes utiles

| Commande                   | Description                                             |
| -------------------------- | ------------------------------------------------------- |
| `dsa.msc`                  | Ouvre la console *Active Directory Users and Computers* |
| `Get-ADUser -Filter *`     | Liste tous les utilisateurs du domaine                  |
| `Get-ADGroup -Filter *`    | Liste tous les groupes                                  |
| `Get-ADComputer -Filter *` | Liste tous les ordinateurs                              |
| `gpedit.msc`               | Gérer les stratégies de groupe locales                  |
| `repadmin /replsummary`    | Vérifie la réplication AD                               |

---

## 🏁 7️⃣ Conclusion

Le contrôleur de domaine `DC300153476.DC300153476-00.local` gère la sécurité, l’authentification et les stratégies du réseau.

Grâce à cette installation :

* Je disposes d’un **environnement de test complet** pour pratiquer la gestion AD.
* Je maîtrises les **commandes PowerShell essentielles**.
* Je comprends la **structure logique d’un domaine et d’une forêt**.

🚀 **Prochaine étape :** créer des utilisateurs, des OU, et appliquer des stratégies GPO !

---

✨ *Projet réalisé par Ramatoulaye Diallo – Collège Boréal, 2025*

