

# 📘 **README.md – TP Active Directory (AD DS)**

### **Étudiant : 300148450 – Hocine**

### **Cours : INF1084 – Services Réseau / Active Directory**

### **Professeur : Collège Boréal**

---

# 🧩 1️⃣ Présentation du TP

L’objectif de ce TP était d’installer et configurer un **contrôleur de domaine Active Directory (AD DS)** sur Windows Server 2022, puis d’automatiser la gestion des utilisateurs avec PowerShell.

Les tâches réalisées sont :

* Installation du rôle AD DS
* Création d’un domaine unique basé sur mon ID
* Vérification du bon fonctionnement d'Active Directory
* Création d’un fichier `bootstrap.ps1` contenant mes informations AD
* Gestion des utilisateurs à l’aide de scripts PowerShell
* Déplacement d’un utilisateur dans une OU dédiée
* Exportation des comptes utilisateurs

---

# 🖥️ 2️⃣ Informations du domaine

| Élément               | Valeur                               |
| --------------------- | ------------------------------------ |
| Numéro étudiant       | **300148450**                        |
| Instance              | **00**                               |
| Domaine FQDN          | **DC300148450-00.local**             |
| NetBIOS               | **DC300148450-00**                   |
| Compte Administrateur | `Administrator@DC300148450-00.local` |

---

# ⚙️ 3️⃣ Étapes de réalisation

## ✔️ Renommage du serveur

```powershell
Rename-Computer -NewName "DC300148450" -Restart
```

---

## ✔️ Installation du rôle Active Directory

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

---

## ✔️ Création du domaine et de la forêt

```powershell
Install-ADDSForest `
    -DomainName "DC300148450-00.local" `
    -DomainNetbiosName "DC300148450-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Infra@2024" -AsPlainText -Force) `
    -Force
```

Après le redémarrage, connexion avec :

```
DC300148450-00\Administrator
```

---

# 📂 4️⃣ Organisation des scripts (TP AD)

Dans le répertoire :

```
4.OUs/300148450/
```

J’ai créé les fichiers suivants :

---

## 📌 **bootstrap.ps1**

Contient les informations principales du domaine :

* Domaine FQDN
* Nom NetBIOS
* Identifiants sécurisés
* Mot de passe pour les opérations AD

Ce fichier est chargé dans tous les autres scripts.

---

## 📌 **utilisateurs1.ps1 – Lister les utilisateurs**

Liste tous les utilisateurs du domaine (sauf comptes internes AD).

---

## 📌 **utilisateurs2.ps1 – Gestion d’un utilisateur**

Actions :

* Création d’un utilisateur
* Modification
* Désactivation
* Réactivation

(Script conforme au TP)

---

## 📌 **utilisateurs3.ps1 – Export CSV**

Exporte la liste des utilisateurs dans :

```
TP_AD_Users.csv
```

---

## 📌 **utilisateurs4.ps1 – Gestion de l’OU Students**

Actions :

* Vérification / création de l’OU **Students**
* Déplacement de l’utilisateur **Alice Dupont**
* Vérification du DistinguishedName (DN)

---

# 🔍 5️⃣ Vérifications effectuées

J’ai validé que :

✔ Le rôle AD DS est installé
✔ Le DNS fonctionne correctement
✔ Le contrôleur de domaine répond aux commandes
✔ Les scripts PowerShell communiquent avec AD
✔ L’utilisateur Alice est bien déplacé dans l’OU *Students*
✔ Le CSV d’export est généré
✔ Tous les scripts fonctionnent sans erreur

---





* Installation AD DS
* Création du domaine
* Execution des scripts
* Vérifications AD
* OU Students et utilisateur déplacé



---

# 🎯 7️⃣ Conclusion

Ce TP m’a permis de :

* Maîtriser l’installation d’un contrôleur de domaine
* Comprendre la structure AD (domaine, OU, objets)
* Utiliser PowerShell pour automatiser la gestion des utilisateurs
* Manipuler des OU, déplacer et modifier des comptes
* Exporter les données AD pour analyse

Je dispose maintenant d’un environnement Active Directory fonctionnel, conforme aux exigences du TP.

---

# ✔️ TP Réalisé avec succès 🎉

## *Hocine– 300148450*


