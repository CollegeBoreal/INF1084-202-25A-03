

# 📄 **README.md — Projet : Relation de confiance entre deux forêts Active Directory**


````md
# 🌐 Projet : Création d’une relation de confiance entre deux forêts Active Directory

## 👤 Étudiant
Ikram
Smail

---

## 🎯 Objectifs du projet
- Utiliser deux forêts Active Directory déjà installées (AD1 et AD2).
- Vérifier la connectivité et la résolution DNS entre domaines.
- Créer une relation de confiance (trust) bidirectionnelle entre les deux forêts.
- Tester l’accès entre forêts via des commandes PowerShell.
- Automatiser l’ensemble via un script CLI.

---

## 🏗️ 1. Préparation (sans création de forêt)
Les deux forêts **existaient déjà** :

- **Forêt AD1** : `DC300146418-00.local`  
- **Forêt AD2** : `DC300146721_001.local`

Objectif : établir un trust entre ces deux forêts.

---

## 🌐 2. Vérification DNS et connectivité

### 🔎 Vérifier la résolution DNS
```powershell
nslookup DC300146418-00.local
nslookup DC300146721_001.local
````

### 🧪 Tester la connectivité réseau

```powershell
Test-Connection DC300146418-00.local
Test-Connection DC300146721_001.local
```

---

## 🔗 3. Création du trust entre les forêts

### ✔ Trust bidirectionnel via `netdom`

Depuis AD1 :

```powershell
netdom trust DC300146418-00.local /Domain:DC300146721_001.local `
    /UserD:Administrator /PasswordD:Infra@2024 `
    /UserO:Administrator /PasswordO:Infra@2024 `
    /Add /TwoWay /TrustType:External
```

---

## 🧪 4. Vérification du trust

### Vérifier depuis AD1 :

```powershell
netdom trust DC300146418-00.local /Domain:DC300146721_001.local /Verify
```

### Vérifier via PowerShell :

```powershell
Get-ADTrust -Filter * -Server DC300146418-00.local
```

---

## 📂 5. Accès à AD2 depuis AD1

### 1️⃣ Obtenir les identifiants de AD2

```powershell
$credAD2 = Get-Credential -Message "Entrez le compte administrateur de AD2"
```

### 2️⃣ Tester si AD2 répond

```powershell
Test-Connection -ComputerName DC300146721_001.local -Count 2
```

### 3️⃣ Lire les informations du domaine AD2

```powershell
Get-ADDomain -Server DC300146721_001.local -Credential $credAD2
```

### 4️⃣ Lister les utilisateurs d’AD2

```powershell
Get-ADUser -Filter * -Server DC300146721_001.local -Credential $credAD2
```

---

## 📁 6. Naviguer dans AD2 via un PSDrive

```powershell
New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "" `
    -Server DC300146721_001.local -Credential $credAD2

Set-Location AD2:\DC=DC300146721_001,DC=local

Get-ChildItem
```

---

## 📦 7. Script CLI complet

```powershell
############################################
# SCRIPT COMPLET : Gestion du Trust entre AD1 et AD2
# Auteur : Ikram , Smail
############################################

Write-Host "=== Étape 1 : Identifiants AD2 ===" -ForegroundColor Cyan
$credAD2 = Get-Credential -Message "Entrez les identifiants ADMIN de AD2"

Write-Host "=== Étape 2 : Test DNS ===" -ForegroundColor Cyan
nslookup DC300146721_001.local
Test-Connection -ComputerName DC300146721_001.local -Count 2

Write-Host "=== Étape 3 : Infos domaine AD2 ===" -ForegroundColor Cyan
Get-ADDomain -Server DC300146721_001.local -Credential $credAD2

Write-Host "=== Étape 4 : Liste des utilisateurs AD2 ===" -ForegroundColor Cyan
Get-ADUser -Filter * -Server DC300146721_001.local -Credential $credAD2

Write-Host "=== Étape 5 : Création du trust ===" -ForegroundColor Cyan
netdom trust DC300146418-00.local /Domain:DC300146721_001.local `
    /UserD:Administrator /PasswordD:Infra@2024 `
    /UserO:Administrator /PasswordO:Infra@2024 `
    /Add /TwoWay /TrustType:External

Write-Host "=== Étape 6 : Vérification du trust ===" -ForegroundColor Green
netdom trust DC300146418-00.local /Domain:DC300146721_001.local /Verify
```

---

## 📦 8. Verification
✔️ a) Ouverture de la console des trusts

Depuis PowerShell :

domain.msc
✔️ b) Vérification des trusts existants

Dans les deux domaines, affichage :

Outgoing trusts : domaines que ce domaine fait confiance

Incoming trusts : domaines qui font confiance à ce domaine

Les deux domaines affichent des trusts de type Realm, non transitifs, exactement comme attendu.

✔️ c) Vérification PowerShell

Exécution :

Get-ADDomain -Server DC300146721_001.local -Credential $cred
Get-ADDomain -Server DC300146418-00.local -Credential $cred

Résultat observé :

Les informations de domaine sont correctes



Le ForeignSecurityPrincipalsContainer est bien présent, confirmant que des trusts peuvent être utilisés

🧪 3. Résultats obtenus

Les relations Realm Trust sont bien créées.

Elles apparaissent des deux côtés : incoming et outgoing.


Les commandes Get-ADDomain confirment que les deux domaines fonctionnent correctement.

📝 4. Conclusion

Le TP confirme que :

Il est possible de créer un trust entre deux domaines

Les trusts  sont correctement configurés.

Les consoles graphiques et PowerShell affichent des résultats cohérents.
<img src="images/3333.png" alt="Images" width="450"/>
<img src="images/3333.png" alt="Images" width="450"/>
<img src="images/3333.png" alt="Images" width="450"/>
<img src="images/3333.png" alt="Images" width="450"/>
<img src="images/3333.png" alt="Images" width="450"/>
