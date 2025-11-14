# Projet INF1084-2025-o3-Utilisateurs

## Description
Ce projet contient des scripts PowerShell pour la gestion d'utilisateurs et de groupes dans un environnement de type Active Directory. Chaque script explique la creation des 
utilisateurs, des groupes, l'utilisation de tableaux et l'import/ export de fichiers csv
---

## Contenu du projet

### 1. utilisateurs1.ps1
Création de 5 utilisateurs simulés.

![Capture utilisateurs1](captures/Capture1.png)

---

### 2. utilisateurs2.ps1
Création de groupes simulés et ajoutes utilisateurs selon leur OU.

![utilisateurs2](captures/Capture2.png)

---

### 3. utilisateurs3.ps1
Filtrage des utilisateurs selon différentes conditions :
- Nom commençant par "B"
- OU = "Stagiaires"
- Prénom contenant "a" (insensible à la casse)

![utilisateurs3](captures/Capture3.png)

---

### 4. utilisateurs4.ps1
Import depuis CSV, création 'un groupe "ImportGroupe",Il illustre également l'export des utilisateurs vers un fichier CSV, la manipulation des tableaux et la visualisation du contenu
 du groupe, tout en affichant des informations claires sur chaque utilisateur.
![utilisateurs4](captures/Capture4.png)

---

### 5. Mini-projet.ps1
Création des utilisateurs de la promo2025, groupe "Etudiants2025", ajout des utilisateurs au groupe et export CSV.

![mini-projet](captures/miniprojet1.png)

---

## Instructions pour exécuter les scripts
1. Ouvrir PowerShell.
2. Se placer dans le dossier contenant les scripts.
3. Pour exécuter un script et utiliser les variables d'un autre script, utilisez le **dot sourcing** :
```powershell
. .\utilisateurs1.ps1
  
