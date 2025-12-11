# TP Services Windows / Active Directory

## Auteur
Nom : Hocine 


Numéro étudiant : 300148450  

## Objectifs du TP
- Identifier et lister les services Windows critiques pour Active Directory.
- Vérifier l’état des services AD.
- Consulter les logs liés aux services AD.
- Exporter des logs pour analyse.
- Démarrer, arrêter et redémarrer des services AD.

## Fichiers créés pour le TP

### services1.ps1
- **But :** Lister tous les services liés à Active Directory et vérifier l’état des services principaux (NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ).

### services2.ps1
- **But :** Afficher les logs récents des services Active Directory et du système, afin de vérifier leur fonctionnement et détecter d’éventuelles erreurs.

### services3.ps1
- **But :** Exporter les événements récents du service Directory Service dans un fichier CSV pour analyse et suivi.

### services4.ps1
- **But :** Arrêter et redémarrer le service DFSR, puis vérifier son état pour s’assurer que le service fonctionne correctement après le redémarrage.
---
## Étapes d’exécution
1. Ouvrir PowerShell en mode administrateur.
2. Se rendre dans le dossier TP :
cd C:\Users\Administrator\TP_Services_AD
3. Lancer les scripts dans cet ordre :
.\services1.ps1
.\services2.ps1
.\services3.ps1
.\services4.ps1
4. Vérifier que :
- Les services AD sont visibles et fonctionnels.
- Les logs sont affichés et le fichier C:\Logs\ADLogs.csv est créé.
- DFSR a bien été redémarré.

## Résultats attendus
- Tous les services AD sont listés et leur état est connu.
- Les 20 derniers événements AD et système sont affichés.
- Un fichier CSV contenant les 50 derniers événements AD est créé.
- Le service DFSR est arrêté puis redémarré, et son état est vérifié.

## Bonnes pratiques
- Toujours vérifier l’état d’un service avant de l’arrêter.
- Sur un DC, consultez le journal Directory Service dans Event Viewer pour détecter les problèmes AD.
- Exporter régulièrement les logs pour analyse et sauvegarde.

## Références
- Active Directory Services : NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ
- PowerShell : Get-Service, Get-EventLog, Get-WinEvent, Export-Csv, Stop-Service, Start-Service


