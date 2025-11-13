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

