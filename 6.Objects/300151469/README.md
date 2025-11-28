<<<<<<< HEAD
=======
# TP Services AD – 300151469

## 1. Création de l’OU
- OU : Students
- Protégé contre suppression accidentelle

## 2. Création du groupe
- Groupe : Students
- Scope : Global
- Description : Users allowed RDP and shared folder access

## 3. Création des utilisateurs
- Etudiant1, Etudiant2
- Ajoutés au groupe Students
- Mot de passe : Pass123!

## 4. Dossier partagé
- Path : C:\SharedResources
- Partage SMB : SharedResources
- Accès complet : Groupe Students

## 5. GPO pour mapper le lecteur Z:
- GPO : MapSharedFolder
- Script logon : MapDrive-Z.bat
- Lecture automatique du lecteur Z: sur le chemin \\DC300151469-00\SharedResources

## 6. RDP
- RDP activé sur le serveur
- Firewall RDP autorisé
- Droit logon via RDP pour le groupe Students
>>>>>>> 2126f6cb (Ajout UT1 UT2 UT3 terminés)

