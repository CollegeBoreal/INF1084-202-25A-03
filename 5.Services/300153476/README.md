# 📘 README – Laboratoire : Gestion des Services Active Directory avec PowerShell

## 🧮 Objectifs du laboratoire

Ce laboratoire a pour but de manipuler différents services liés à **Active Directory (AD)** à l’aide de PowerShell :

✔️ Lister les services AD et vérifier leur état  
✔️ Afficher les événements des services AD  
✔️ Exporter les journaux d’événements dans un fichier  
✔️ Arrêter et redémarrer un service AD  

> 🔖 **Convention de nommage**  
> Les scripts PowerShell doivent être nommés selon le format :  
> **services1.ps1 → services4.ps1**

---

## 📂 Contenu des scripts

---

### 🔹 services1.ps1 – Lister les services AD

```powershell
# Lister tous les services liés à AD
Get-Service | Where-Object {
    $_.DisplayName -like "*Directory*" -or $_.Name -match "NTDS|ADWS|DFSR|kdc|Netlogon|IsmServ"
} | Sort-Object DisplayName

# Vérifier l’état d’un service spécifique
Get-Service -Name NTDS, ADWS, DFSR
```
# 📚 Références Active Directory

Voici un résumé clair des principaux services et concepts d’Active Directory.

---

## 🏛️ 1️⃣ DC – Domain Controller (Contrôleur de domaine)

- Authentifie utilisateurs et ordinateurs  
- Stocke la base de données **NTDS.dit**  
- Réplique les données entre DC  
- Fournit **Kerberos** & **Netlogon**

➡️ C’est le **cœur d’Active Directory**.

---

## 🧰 2️⃣ GPO – Group Policy Object

Permet de gérer automatiquement les paramètres des utilisateurs et ordinateurs :

- Verrouillage automatique  
- Scripts de connexion  
- Installation d’applications  

📍 Stockées dans **SYSVOL** et répliquées via **DFSR**.

---

## 🌐 3️⃣ AD DS – Active Directory Domain Services

- Gestion des comptes et groupes  
- Authentification (Kerberos)  
- Autorisation  
- Réplication AD  

➡️ Le service principal est **NTDS**.

---

## 🔗 4️⃣ ADWS – Active Directory Web Services

Permet la gestion d’Active Directory via :

- PowerShell  
- ADAC  
- Outils modernes  

Indispensable pour les cmdlets ActiveDirectory.

---

## 🔁 5️⃣ DFSR – Distributed File System Replication

Assure la réplication :  

- **SYSVOL**  
- Scripts  
- GPO  

➡️ Garantit une synchronisation cohérente entre DC.

---

## 🔐 6️⃣ KDC – Key Distribution Center

Service Kerberos chargé de créer :

- Les tickets d’authentification **TGT**  
- Les tickets de service **TGS**

---

## 🔧 7️⃣ Netlogon

Assure :  

- Localisation d’un DC  
- Authentification réseau  
- Mise à jour des enregistrements DNS des DC  

---

## 📨 8️⃣ ISM / IsmServ – Intersite Messaging Service

Assure la **réplication inter-sites** dans AD.

---

## 🗂️ 9️⃣ Autres abréviations utiles

| Abréviation | Signification | Rôle |
|------------|--------------|------|
| **OU** | Organizational Unit | Organiser les objets, appliquer des GPO |
| **FSMO** | Flexible Single Master Operations | Rôles spéciaux détenus par certains DC |
| **LDAP** | Lightweight Directory Access Protocol | Protocole utilisé pour interroger AD |
| **SYSVOL** | System Volume | Contient scripts & GPO répliqués |
| **RDP** | Remote Desktop Protocol | Accès distant aux serveurs |

---

# 🎯 Conclusion

Ce laboratoire vous a permis de :

✔️ Manipuler les services Active Directory  
✔️ Lire et exporter les journaux d’événements  
✔️ Arrêter et redémarrer un service système  
✔️ Comprendre les composants clés d’Active Directory  

---


