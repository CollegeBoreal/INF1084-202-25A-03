
 # Laboratoires Services – 300151347

## Objectifs
- Explorer les services liés à Active Directory
- Consulter les journaux (logs) des services AD
- Exporter les logs dans un fichier CSV
- Manipuler un service (arrêt, vérification, redémarrage)

## Scripts réalisés

### services1.ps1
- Liste les services liés à Active Directory (NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ).
- Affiche l’état des services NTDS, ADWS et DFSR.

### services2.ps1
- Affiche les 20 derniers événements du journal "Directory Service".
- Filtre les événements du journal "System" pour le service Netlogon.
- Utilise Get-WinEvent pour afficher les événements au format moderne.

### services3.ps1
- Exporte les 50 derniers événements "Directory Service" dans le fichier ADLogs.csv.

### services4.ps1
- Arrête le service DFSR.
- Affiche le statut du service DFSR.
- Redémarre le service DFSR.

## Fichier ADLogs.csv
- Contient les événements du journal "Directory Service" exportés depuis le DC.
 (Ajout des scripts services pour 300151347)
