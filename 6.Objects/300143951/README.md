# Rapport de Configuration Active Directory

**INF1084 - Collège Boréal**  
**Étudiant:** 300143951  

---

## Vue d'ensemble

Ce projet implique la configuration complète d'un domaine Active Directory avec 4 scripts PowerShell interconnectés. Chaque script ajoute une couche de fonctionnalité pour gérer les utilisateurs, les partages réseau, les GPO et l'accès RDP.

---

## 1. utilisateurs1.ps1 - Utilisateurs et Partages

### Objectifs
- Création du groupe AD 'Students'
- Création des utilisateurs Etudiant1 et Etudiant2
- Configuration des permissions NTFS
- Création du partage SMB 'SharedResources'

### Résultats
✓ Groupe 'Students' créé avec succès  
✓ Utilisateurs Etudiant1 et Etudiant2 ajoutés au groupe  
✓ Partage disponible à: `\\DC-300143951\SharedResources`

---

## 2. utilisateurs2.ps1 - Stratégies de Groupe (GPO)

### Objectifs
- Création de la GPO 'MapSharedFolder'
- Configuration des préférences de groupe (GPP)
- Mappage automatique du lecteur Z: vers SharedResources

### Résultats
✓ GPO liée à l'OU Students  
✓ Dossier Drives créé dans SYSVOL  
✓ Configuration GPP appliquée - lecteur Z: mappé automatiquement  
✓ Commande à exécuter: `gpupdate /force` sur les clients

---

## 3. utilisateurs3.ps1 - Politiques de Sécurité

### Objectifs
- Configuration des droits de connexion distante
- Application des templates de sécurité Windows

### Résultats
✓ Tâche exécutée avec succès  
✓ Logs disponibles à: `%windir%\security\logs\scesrv.log`

---

## 4. utilisateurs4.ps1 - Accès RDP

### Objectifs
- Activation du Remote Desktop Protocol (RDP)
- Configuration des règles pare-feu
- Ajout du groupe Students au groupe 'Remote Desktop Users'

### Défis et Solutions

**Problème:** Le groupe 'Remote Desktop Users' n'était pas trouvé par `Add-LocalGroupMember`

**Solution:** Utilisation de `[ADSI]` plutôt que le cmdlet natif pour une meilleure compatibilité

### Résultats
✓ Groupe 'Students' ajouté aux utilisateurs RDP avec succès

---

## Conclusion

Tous les scripts ont été exécutés avec succès. L'infrastructure Active Directory est maintenant configurée avec:

- Gestion des utilisateurs et des groupes
- Partage réseau sécurisé via SMB
- Déploiement automatique via GPO
- Accès RDP contrôlé pour le groupe Students
