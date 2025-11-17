# 🧩 Windows Services & Active Directory – TP INF1084

## Overview

Ce dépôt contient les scripts PowerShell pour la **gestion et l’analyse des services Windows liés à Active Directory (AD DS)**.
Tous les scripts ont été testés dans un environnement de laboratoire sous Windows Server.

---

## 1️⃣ Objectif du TP

L’objectif est de :

* Lister et vérifier les services liés à AD
* Gérer l’état des services critiques (NTDS, DFSR, ADWS…)
* Analyser et exporter les journaux d’événements Active Directory
* Automatiser ces opérations via des scripts PowerShell

---

## 2️⃣ Scripts PowerShell créés

### services1.ps1

```powershell
# Lister tous les services liés à AD
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

# Vérifier l’état de services spécifiques
Get-Service -Name NTDS, ADWS, DFSR
```

### services2.ps1

```powershell
# Afficher les 20 derniers événements liés à AD
Get-EventLog -LogName "Directory Service" -Newest 20

# Logs Netlogon dans le journal système
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}

# Journaux modernes (Event Viewer v2)
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 | Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize
```

### services3.ps1

```powershell
# Exporter les 50 derniers événements AD dans un CSV
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 | Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation
```

### services4.ps1

```powershell
# Gestion du service DFSR
Stop-Service -Name DFSR
(Get-Service -Name DFSR).Status
Start-Service -Name DFSR
```

---

## 3️⃣ Bonnes pratiques

* Vérifier les dépendances avant d’arrêter un service critique
* Préférer `Restart-Service` pour relancer un service
* Surveiller régulièrement les journaux **Directory Service** pour détecter les erreurs
* Exporter les logs pour audit et documentation

---

## 4️⃣ Structure du projet

```
INF1084-202-25A-03/
└── 5.Services/
    └── 300150433/
        ├── README.md
        ├── services1.ps1
        ├── services2.ps1
        ├── services3.ps1
        ├── services4.ps1
```

---

## 5️⃣ Environnement

**OS :** Windows Server 2022
**Outils :** PowerShell 7, RSAT, Event Viewer
**ID étudiant :** 300150433
**Cours :** INF1084-202-25A-03 – Administration Windows Server

---

## 6️⃣ Auteur

**Nom :** Zakaria Djellouli
**Session :** Automne 2025
**Institution :** Collège Boréal

---

## ✅ Conclusion

Ce TP permet de comprendre le fonctionnement des services Windows liés à AD, de gérer leur état et d’analyser les journaux d’événements via PowerShell, tout en appliquant des pratiques d’administration sécurisées et reproductibles.

---
