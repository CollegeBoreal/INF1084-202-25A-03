📘 README – Laboratoire : Gestion des Services Active Directory avec PowerShell
🧮 Objectifs du laboratoire

Ce laboratoire a pour but de manipuler différents services liés à Active Directory (AD) à l’aide de PowerShell :

✔️ Lister les services AD et vérifier leur état
✔️ Afficher les événements des services AD
✔️ Exporter les journaux d’événements dans un fichier
✔️ Arrêter et redémarrer un service AD

🔖 Convention de nommage
Les scripts PowerShell doivent être nommés selon le format :
services1.ps1 → services4.ps1

📂 Contenu des scripts
🔹 services1.ps1 – Lister les services AD
# Lister tous les services liés à AD
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

# Vérifier l’état d’un service spécifique
Get-Service -Name NTDS, ADWS, DFSR

🔹 services2.ps1 – Afficher les événements AD
# Afficher les 20 derniers événements liés à NTDS
Get-EventLog -LogName "Directory Service" -Newest 20

# Afficher les logs du système filtrés par Netlogon
Get-EventLog -LogName "System" -Newest 20 | Where-Object {$_.Source -eq "Netlogon"}

# Afficher les logs via le journal moderne (Event Viewer v2)
Get-WinEvent -LogName "Directory Service" -MaxEvents 20 |
    Format-Table TimeCreated, Id, LevelDisplayName, Message -AutoSize

🔹 services3.ps1 – Exporter les événements
Get-WinEvent -LogName "Directory Service" -MaxEvents 50 |
    Export-Csv -Path "C:\Logs\ADLogs.csv" -NoTypeInformation

🔹 services4.ps1 – Gestion d'un service
Stop-Service -Name DFSR
(Get-Service -Name DFSR).Status
Start-Service -Name DFSR

📚 Références Active Directory (Résumé clair et utile)

Voici un résumé des principaux services et concepts rencontrés dans Active Directory :

🏛️ 1️⃣ DC – Domain Controller (Contrôleur de domaine)

✔️ Authentifie utilisateurs et ordinateurs
✔️ Stocke la base AD NTDS.dit
✔️ Réplique les données entre DC
✔️ Fournit Kerberos & Netlogon

➡️ C’est le cœur d’Active Directory.

🧰 2️⃣ GPO – Group Policy Object

Permet de gérer automatiquement :

Verrouillage automatique

Scripts de connexion

Installation d’applications

📍 Stockées dans SYSVOL et répliquées via DFSR.

🌐 3️⃣ AD DS – Active Directory Domain Services

Service principal d’Active Directory.
Il gère :
✔️ Comptes & groupes
✔️ Authentification Kerberos
✔️ Autorisations
✔️ Réplication

🔗 4️⃣ ADWS – Active Directory Web Services

Permet la gestion AD via :

PowerShell

ADAC

Outils modernes
Indispensable pour les cmdlets ActiveDirectory.

🔁 5️⃣ DFSR – Distributed File System Replication

Réplique :

SYSVOL

Scripts

GPO

➡️ Essentiel pour garder tous les DC synchronisés.

🔐 6️⃣ KDC – Key Distribution Center

Service Kerberos :

Génère les tickets d’authentification (TGT, TGS)

🔧 7️⃣ Netlogon

Assure :
✔️ Localisation d’un DC
✔️ Authentification réseau
✔️ Mise à jour des enregistrements DNS des DC

📨 8️⃣ ISM / IsmServ – Intersite Messaging Service

Gestion de la réplication inter-sites.
Utilisé lorsque les DC sont dans différents sites AD.

🗂️ 9️⃣ Autres abréviations utiles
Abréviation	Signification	Rôle
OU	Organizational Unit	Organiser les objets AD, appliquer des GPO
FSMO	Flexible Single Master Operations	Rôles critiques détenus par certains DC
LDAP	Lightweight Directory Access Protocol	Protocole utilisé pour interroger AD
SYSVOL	System Volume	Contient GPO & scripts répliqués sur les DC
RDP	Remote Desktop Protocol	Connexion distante aux serveurs
🎯 Conclusion

Ce laboratoire vous a permis d’apprendre à :

✔ Manipuler et analyser les services Active Directory
✔ Lire et exporter les journaux d’événements
✔ Contrôler un service système via PowerShell
✔ Identifier les composants clés d’Active Directory
