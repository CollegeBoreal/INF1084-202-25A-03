# 🧩 Services Windows & Active Directory – Documentation Technique



## 1️⃣ 
**Zakaria Djellouli**
**ID Étudiant : 300150433**
---

## 2️⃣ Services principaux d’Active Directory et dépendances

| Service      | Processus                           | Description                                            |
| ------------ | ----------------------------------- | ------------------------------------------------------ |
| **NTDS**     | Active Directory Domain Services    | Base de données AD et logique du répertoire            |
| **ADWS**     | Active Directory Web Services       | Administration AD à distance via PowerShell/RSAT       |
| **DFSR**     | Distributed File System Replication | Réplication de SYSVOL et des GPO entre les contrôleurs |
| **KDC**      | Kerberos Key Distribution Center    | Gestion des tickets Kerberos                           |
| **Netlogon** | Netlogon Service                    | Authentification et enregistrement DNS du DC           |
| **IsmServ**  | Intersite Messaging Service         | Support de la réplication entre sites AD               |

---

## 3️⃣ Architecture fonctionnelle

**Résumé des interactions :**

* `NTDS` est le cœur d'Active Directory
* `KDC` gère l'authentification Kerberos
* `Netlogon` est vital pour la connexion au domaine
* `DFSR` assure la cohérence du SYSVOL
* `ADWS` fournit les interfaces Web d'administration
* `IsmServ` gère la réplication multisite

---

## 4️⃣ Opérations PowerShell

### 4.1 Lister les services liés à Active Directory

```powershell
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName
```

### 4.2 Vérifier l’état des services

```powershell
Get-Service -Name NTDS, ADWS, DFSR
```

### 4.3 Gérer le cycle de vie des services

```powershell
Start-Service -Name Netlogon
Stop-Service -Name DFSR
Restart-Service -Name NTDS
```

### 4.4 Analyse des journaux d’événements

```powershell
Get-EventLog -LogName "Directory Service" -Newest 20
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 | Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
```

### 4.5 Exportation des journaux

```powershell
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```

---

## 5️⃣ Scripts d’automatisation

### services1.ps1

```powershell
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName
Get-Service -Name NTDS, ADWS, DFSR
```
<img width="692" height="207" alt="1" src="https://github.com/user-attachments/assets/197b6468-9fa7-434c-9a09-8b2cd84499ab" />

### services2.ps1

```powershell
Get-EventLog -LogName "Directory Service" -Newest 20
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 | Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
```
<img width="1319" height="656" alt="2" src="https://github.com/user-attachments/assets/5ba4144c-88cd-45dc-b0b9-e6e8a4cd7521" />

### services3.ps1

```powershell
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```
<img width="803" height="52" alt="3" src="https://github.com/user-attachments/assets/1d29bbac-bfaf-4ee9-8221-97c5928a5981" />

### services4.ps1

```powershell
Stop-Service -Name DFSR
(Get-Service -Name DFSR).Status
Start-Service -Name DFSR
```
<img width="667" height="34" alt="4" src="https://github.com/user-attachments/assets/62e7626f-b46b-44c5-8d60-9096e8bb620f" />

---

## 6️⃣ Matrice des dépendances

| Service  | Dépendance critique | Impact en cas d’arrêt                   |
| -------- | ------------------- | --------------------------------------- |
| NTDS     | Noyau               | Domaine indisponible, GPO inaccessibles |
| KDC      | NTDS                | Échec d’authentification Kerberos       |
| Netlogon | KDC                 | Impossible de se connecter au domaine   |
| DFSR     | NTDS                | Réplication SYSVOL bloquée              |
| ADWS     | NTDS                | Gestion AD à distance impossible        |
| IsmServ  | DFSR                | Réplication multisite interrompue       |

---

## 7️⃣ Bonnes pratiques d'administration

* Toujours vérifier les dépendances avant d’arrêter un service AD
* Préférer `Restart-Service` à une séquence Stop → Start
* Surveiller régulièrement les journaux **Directory Service**
* Exporter les logs pour audit et diagnostic
* Garder une synchronisation horaire correcte pour Kerberos

---

## 8️⃣ Objectifs du laboratoire

* Lister et analyser les services AD
* Examiner les journaux Active Directory
* Exporter les logs de diagnostic
* Automatiser la gestion des services via PowerShell

---

## 9️⃣ Environnement utilisé

* **OS :** Windows Server 2022
* **Outils :** PowerShell 7, Event Viewer, RSAT
* **Lab :** Contrôleur de domaine Active Directory

---

## ✅ Conclusion

Cette documentation regroupe les connaissances essentielles sur les **services Windows** et leur rôle au sein d’**Active Directory**.
Les scripts PowerShell démontrent la maîtrise de l’automatisation, la compréhension des dépendances critiques et les bonnes pratiques d’administration système en environnement professionnel.

---
