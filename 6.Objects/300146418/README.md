Bien sûr Ikram ! Voici **tout ton README.md prêt à être collé directement dans ton fichier GitHub**, **dans un seul bloc Markdown**, sans texte autour.

👇 **Copie-colle tel quel dans ton fichier README.md** :

```markdown
# 🧪 TP Active Directory – Partage réseau, GPO et RDP  
**Auteur : 300146418 — Ikram**  
**Cours : INF1084 – Services Réseau (Windows Server 2022)**

---

## 🎯 Objectif du TP
Ce TP consiste à automatiser l’administration d’un domaine Active Directory uniquement avec **PowerShell**, sans interface graphique.

Objectifs :

- créer des utilisateurs et un groupe AD  
- créer un partage réseau sécurisé  
- générer une GPO qui mappe automatiquement un lecteur Z:  
- autoriser l’accès RDP à un groupe  
- tester la configuration sur un utilisateur étudiant  

---

## 🗂️ Structure du répertoire
```

INF1084-202-25A-03/
└── 6.Objects/
└── 300146418/
├── utilisateurs1.ps1
├── utilisateurs2.ps1
├── utilisateurs3.ps1
├── README.md
└── images/

````

---

## 🏛️ 1. Initialisation avec bootstrap.ps1

Avant d’exécuter les scripts, les variables du domaine sont chargées depuis :

```powershell
. "C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300146418\bootstrap.ps1"
````

Ce script fournit automatiquement :

* **domainName** → ex : `DC300146418-00.local`
* **netbiosName** → ex : `DC300146418-00`
* **cred** → identifiants administrateurs du domaine

Ces variables sont utilisées dans tous les scripts du TP.

---

## 🧩 2. Description des scripts PowerShell

### 📌 1️⃣ `utilisateurs1.ps1` — Création des objets Active Directory

Ce script :

* crée le groupe AD **Students**
* crée les utilisateurs (ex : Etudiant1, Etudiant2…)
* configure un mot de passe initial
* active les comptes
* ajoute tous les utilisateurs dans le groupe Students

**🎯 But : préparer tous les comptes nécessaires au TP.**

---

### 📌 2️⃣ `utilisateurs2.ps1` — Création de la GPO pour mapper le lecteur Z:

Ce script :

* crée une GPO appelée **MapSharedFolder**
* lie la GPO à l’OU : `OU=Utilisateurs`
* génère un script `MapDriveZ.bat` dans SYSVOL
* configure un mappage automatique :

  ```
  Z: → \\DC300146418-00\partage
  ```

⚠️ **Étape manuelle obligatoire dans GPMC :**

```
GPMC → GPO "MapSharedFolder" → 
User Configuration → Windows Settings → Scripts (Logon)
Ajouter → MapDriveZ.bat
```

**🎯 But : chaque utilisateur de l'OU "Utilisateurs" obtient un lecteur Z: au login.**

---

### 📌 3️⃣ `utilisateurs3.ps1` — Partage réseau + Permissions + RDP

Ce script :

* crée le dossier `C:\Partage_Students`
* applique les permissions NTFS au groupe Students
* crée le partage SMB :

  ```
  \\DC300146418-00\partage
  ```
* active le Remote Desktop (RDP)
* ajoute le groupe Students aux utilisateurs autorisés à se connecter en RDP

**🎯 But : donner accès au partage réseau + autoriser RDP pour les étudiants.**

---

## 🧪 3. Tests réalisés

### ✔️ Vérification des utilisateurs

```powershell
Get-ADUser -Filter *
```

### ✔️ Vérification des GPO

```powershell
Get-GPO -All
```

### ✔️ Test du partage

Depuis l'explorateur ou PowerShell :

```
\\DC300146418-00\partage
```

### ✔️ Test du lecteur Z:

1. Connexion avec Etudiant1
2. Vérifier que Z: apparaît
3. Essayer de créer un fichier dans Z:\

### ✔️ Test RDP

* Students → RDP autorisé ✔️
* utilisateur non-membre → RDP refusé ❌

---

## 📚 Conclusion

Grâce à ce TP, j’ai automatisé :

* la création de comptes et groupes AD
* le partage réseau sécurisé
* une GPO complète avec script logon
* l’activation et configuration de RDP
* des tests réels avec un utilisateur étudiant

Tout a été fait **100 % PowerShell**, comme dans un environnement professionnel.

---

## 📸 Captures d'écran

Ajouter vos images dans le dossier `/images`.

---

```

Tu peux maintenant l’ajouter dans GitHub !

Si tu veux, je peux aussi te créer :
✅ un schéma Mermaid  
✅ une version PDF  
```
