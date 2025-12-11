# TP Active Directory - INF1084

## Auteur
**Nom :** Ouail GACEM 
**Numéro étudiant :** 300148094

## Domaine utilisé
**Nom de domaine :** DC300148094-00.local  
**Nom NetBIOS :** DC300148094-00  

---

## Fichiers créés pour le TP

### 1️⃣ bootstrap.ps1
- Contient les variables pour le domaine et les credentials de l’administrateur.
- Charge les informations nécessaires pour tous les autres scripts.

### 2️⃣ utilisateurs1.ps1
- Création des utilisateurs dans le conteneur par défaut `CN=Users`.
- Utilisateurs créés :
  - Alice Dupont (`alice.dupont`)
  - Marc Petit (`marc.petit`)
- Commandes principales utilisées :
  - New-ADUser avec nom, SamAccountName, UserPrincipalName, mot de passe et chemin CN=Users

### 3️⃣ utilisateurs2.ps1
- Modification des utilisateurs créés.
- Commandes principales :
  - Modifier description et département avec Set-ADUser
  - Changer le mot de passe avec Set-ADAccountPassword

### 4️⃣ utilisateurs3.ps1
- Désactivation et réactivation d’un utilisateur.
- Commandes principales :
  - Disable-ADAccount pour désactiver
  - Enable-ADAccount pour réactiver

### 5️⃣ utilisateurs4.ps1
- Recherche des utilisateurs dans l’OU “Utilisateurs”
- Export des utilisateurs dans un fichier CSV
- Suppression d’un utilisateur
- Commandes principales :
  - Get-ADUser avec SearchBase sur OU=Utilisateurs
  - Export-Csv pour sauvegarder les informations
  - Remove-ADUser pour supprimer un utilisateur



---

## Étapes d’exécution

1. Charger le bootstrap :

```powershell
. .\bootstrap.ps1
```
2.Créer les utilisateurs :
```powershell
.\utilisateurs1.ps1
```
3.Modifier les utilisateurs :
```powershell
.\utilisateurs2.ps1
```
4.Désactiver et réactiver un utilisateur :
```powershell
.\utilisateurs3.ps1
```
5.Rechercher, exporter et supprimer un utilisateur :
```powershell
.\utilisateurs4.ps1
```
