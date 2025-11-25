# 🧠 TP : Gestion des utilisateurs Active Directory avec PowerShell

Étudiant : Zakaria Djellouli  
ID : 300150433  
Cours : INF1084-202-25A-03 – Administration Windows Server  
Date : 16 novembre 2025

---

## 🎯 Objectif du travail

Ce travail pratique avait pour but de gérer les utilisateurs d’un domaine Active Directory (AD) à l’aide de PowerShell. L’étudiant devait créer un domaine personnalisé basé sur son numéro étudiant, vérifier les services AD DS, et automatiser la gestion des utilisateurs dans le conteneur CN=Users puis dans l’unité d’organisation OU=Students.

---

## 🧩 Étapes réalisées

### 1️⃣ Création de l’environnement de travail
- Clonage du dépôt GitHub du cours :  
  `git clone https://github.com/CollegeBoreal/INF1084-202-25A-03.git`
- Création du dossier Developer puis du dossier personnel `300150433`
- Ajout des fichiers :
  - `README.md` (présentation du travail)
  - `bootstrap.ps1` (configuration du domaine et des identifiants)
  - `images/.gitkeep` (structure du dossier d’images)

### 2️⃣ Configuration du domaine Active Directory
- Numéro étudiant : 300150433  
- Instance : 50  
- Domaine créé : `DC300150433-50.local`  
- Nom NetBIOS : `DC300150433-50`  

Script PowerShell utilisé :

```powershell
$studentNumber = 300150433
$studentInstance = 50
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"
````

---

### 3️⃣ Gestion des utilisateurs

* Création de l’utilisateur : Alice Dupont
* Modification du compte (ajout de courriel et prénom composé)
* Désactivation / Réactivation du compte
* Suppression du compte
* Export des utilisateurs vers un fichier CSV
* Déplacement de l’utilisateur dans l’OU `Students`

---

### 4️⃣ Vérification

* Vérification du domaine avec `Get-ADDomain`
* Vérification du contrôleur de domaine avec `Get-ADDomainController`
* Vérification de la liste des utilisateurs actifs
* Contrôle de la création de l’OU `Students`

---

## 📦 Structure du projet

```
INF1084-202-25A-03/
├── 4.OUs/
│   ├── 300150433/
│   │   ├── README.md
│   │   ├── bootstrap.ps1
│   │   ├── utilisateurs1.ps1
│   │   ├── utilisateurs2.ps1
│   │   ├── utilisateurs3.ps1
│   │   ├── utilisateurs4.ps1
│   │   ├── utilisateurs5.ps1
│   │   ├── utilisateurs6.ps1
│   │   └── images/
│   │       └── .gitkeep
```

---

## 🧾 Résumé du TP

Ce TP m’a permis de :

* Comprendre le rôle des services de domaine Active Directory
* Utiliser PowerShell pour automatiser la création, la modification et la gestion d’utilisateurs
* Manipuler les unités d’organisation (OU) et les comptes d’administration sécurisés
* Appliquer les bonnes pratiques de gestion des utilisateurs sur un serveur Windows Server 2019

```
