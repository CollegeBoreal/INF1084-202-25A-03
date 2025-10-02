# :link: VMs

[:tada: Participation](.scripts/Participation.md) 


Installer et configurer un contrôleur de domaine Active Directory sur **Windows Server 2022**.

---

## 🚀 Étapes avec PowerShell

### 1. Renommer le serveur 

:bulb: remplacer `DC999999999` par votre :id: par example "DC300098957"

```powershell
Rename-Computer -NewName "DC999999999" -Restart
```

*(le serveur va redémarrer)*

---

### 2. Installer le rôle AD DS

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
```

---

### 3. Créer un nouveau domaine (nouvelle forêt)

Exemple avec domaine **DC999999999.local** :

```powershell
Install-ADDSForest -DomainName "DC999999999.local" -DomainNetbiosName "DC999999999" -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) -Force
```

* `-DomainName` → nom DNS du domaine.
* `-DomainNetbiosName` → version courte (max 15 caractères, ex. DC999999999).
* `-InstallDns:$true` → installe DNS en même temps.
* `-SafeModeAdministratorPassword` → mot de passe pour le mode restauration DSRM.
* `-Force` → évite les confirmations.

👉 Le serveur redémarrera automatiquement.

---

### 4. Vérifier l’installation

Une fois redémarré, connecte-toi avec :

```
DC999999999\Administrateur
```

Puis vérifie :

```powershell
Get-ADDomain
Get-ADForest
```

---

## 🎯 Résultat

Avec seulement **3 commandes PowerShell**, tu crées un **contrôleur de domaine Active Directory** complet avec DNS intégré.
