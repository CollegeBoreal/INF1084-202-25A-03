# TP Gestion des utilisateurs Active Directory

## Étudiant
- **Nom** : Rabia Bouhali 
- **ID Boreal** : 300151469 

## Objectif du TP
- Gérer les utilisateurs dans un domaine Active Directory. 
- Créer, modifier, activer/désactiver, supprimer des utilisateurs. 
- Déplacer des utilisateurs depuis le container par défaut `CN=Users` vers une OU spécifique (`OU=Students`). 
- Exporter la liste des utilisateurs dans un fichier CSV.

## Contenu du répertoire
- `bootstrap.ps1` : Script principal avec les informations du domaine et les opérations AD. 
- `utilisateurs1.ps1` à `utilisateurs4.ps1` : Scripts pour la création et gestion des 4 utilisateurs. 
- `TP_AD_Users.csv` : Export des utilisateurs du domaine. 
- `images/` : Dossier pour les images (vide ou `.gitkeep`). 
- `README.md` : Ce fichier.

## Domaine et environnement
- Domaine : `DC300151469-40.local` 
- NetBIOS : `DC300151469-40` 
- Administrateur : `Administrator@DC300151469-40.local` 

## Instructions d’exécution
1. Importer le module Active Directory : 
   ```powershell
   Import-Module ActiveDirectory
Lancer les scripts utilisateurs dans l’ordre :

powershell
Copier le code
.\utilisateurs1.ps1
.\utilisateurs2.ps1
.\utilisateurs3.ps1
.\utilisateurs4.ps1
Vérifier le déplacement des utilisateurs dans l’OU Students :

powershell
Copier le code
Get-ADUser -Filter * -SearchBase "OU=Students,DC=DC300151469-40,DC=local" | Select Name, SamAccountName, Enabled
Résultat attendu
Après exécution :

Tous les utilisateurs créés sont présents et activés.

Les utilisateurs par défaut (student1 et rabia) et les 4 créés sont déplacés dans l’OU Students.

Le fichier TP_AD_Users.csv contient la liste des utilisateurs avec leurs informations.

Remarque : Ce TP doit être exécuté dans un environnement Active Directory fonctionnel, avec le service AD Web Services actif sur le contrôleur de domaine.
