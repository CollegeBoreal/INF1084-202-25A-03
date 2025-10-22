# 🧩 MODULE 2 : Gestion avancée d’Active Directory avec PowerShell

---

## 🧠 Partie 1 : Déploiement et configuration des forêts et des trusts (6 minutes)

### 🎯 Objectif

Configurer des relations de confiance (trusts) entre différents domaines ou forêts pour permettre l’authentification inter-domaines.

### 💻 Commandes

```powershell
# Créer une relation de confiance sortante vers un autre domaine
New-ADTrust -Name "Sales.local" `
            -SourceForest "Lab.local" `
            -TargetForest "Sales.local" `
            -TrustType External `
            -Direction Outbound

# Vérifier les trusts existants
Get-ADTrust -Filter *
```

### 🔍 Vérification

* `Get-ADTrust` doit afficher la nouvelle relation de confiance.
* Tester la connexion entre les domaines via `Test-ADTrust`.

---

## 🧠 Partie 2 : Gestion d’un environnement multi-sites (4 minutes)

### 🎯 Objectif

Organiser les contrôleurs de domaine selon des sites géographiques pour optimiser la réplication et l’authentification.

### 💻 Commandes

```powershell
# Créer un site AD
New-ADReplicationSite -Name "Site1"

# Créer un sous-réseau et l’associer à un site
New-ADReplicationSubnet -Name "192.168.1.0/24" -Site "Site1"

# Assigner un DC à un site
Move-ADDirectoryServer -Identity "DC01" -Site "Site1"
```

### 🔍 Vérification

```powershell
Get-ADReplicationSite | Format-Table Name
Get-ADReplicationSubnet | Format-Table Name, Site
```

---

## 🧠 Partie 3 : Configuration de la réplication AD DS (6 minutes)

### 🎯 Objectif

Contrôler et forcer la réplication entre DC pour assurer la cohérence des données.

### 💻 Commandes

```powershell
# Lister tous les partenaires de réplication
Get-ADReplicationPartnerMetadata -Target "DC01"

# Forcer la réplication
Sync-ADObject -Object "CN=Alice Dupont,OU=Students,DC=Lab,DC=local" `
              -Source "DC01" -Destination "DC02"

# Vérifier l’état de la réplication
Get-ADReplicationFailure -Scope Domain
```

---

## 🧠 Partie 4 : Implémentation des services de répertoire et identité dans Azure (4 minutes)

### 🎯 Objectif

Créer un environnement hybride AD DS + Azure AD.

### 💻 Commandes

```powershell
# Installer Azure AD Module
Install-Module -Name AzureAD

# Se connecter à Azure
Connect-AzureAD -Credential (Get-Credential)

# Créer un utilisateur Azure AD
New-AzureADUser -DisplayName "Alice Dupont" `
                -UserPrincipalName "alice.dupont@domain.onmicrosoft.com" `
                -AccountEnabled $true `
                -PasswordProfile @{ Password = "MotDePasse123!" }
```

---

## 🧠 Partie 5 : Création d’utilisateurs, groupes et ordinateurs (5 minutes)

### 🎯 Objectif

Créer et gérer les comptes dans AD DS.

### 💻 Commandes

```powershell
# Créer un utilisateur
New-ADUser -Name "Bob Martin" `
           -SamAccountName "bob.martin" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "OU=Students,DC=Lab,DC=local"

# Créer un groupe
New-ADGroup -Name "GroupeEtudiants" -GroupScope Global -Path "OU=Groups,DC=Lab,DC=local"

# Ajouter un utilisateur au groupe
Add-ADGroupMember -Identity "GroupeEtudiants" -Members "bob.martin"

# Créer un ordinateur
New-ADComputer -Name "PC01" -Path "OU=Computers,DC=Lab,DC=local"
```

---

## 🧠 Partie 6 : Unités d’organisation (OU) (4 minutes)

### 🎯 Objectif

Organiser les objets AD pour faciliter la gestion et les permissions.

### 💻 Commandes

```powershell
# Créer une OU
New-ADOrganizationalUnit -Name "Students" -Path "DC=Lab,DC=local"

# Déplacer un utilisateur dans une OU
Move-ADObject -Identity "CN=Bob Martin,DC=Lab,DC=local" `
              -TargetPath "OU=Students,DC=Lab,DC=local"
```

---

## 🧠 Partie 7 : Gestion des propriétés des utilisateurs, groupes et ordinateurs (4 minutes)

### 🎯 Objectif

Modifier les attributs et informations de comptes AD.

### 💻 Commandes

```powershell
# Modifier le prénom et l’email d’un utilisateur
Set-ADUser -Identity "bob.martin" `
           -GivenName "Robert" `
           -EmailAddress "robert.martin@lab.local"

# Désactiver un compte
Disable-ADAccount -Identity "bob.martin"

# Supprimer un compte
Remove-ADUser -Identity "bob.martin" -Confirm:$false
```

---

## 🧾 🧩 Récapitulatif Module 2

| Thème                | Commande clé                      | Résultat attendu                  |
| -------------------- | --------------------------------- | --------------------------------- |
| Trusts               | `New-ADTrust`                     | Trust inter-domaines configuré    |
| Sites                | `New-ADReplicationSite`           | Site et sous-réseaux définis      |
| Réplication          | `Sync-ADObject`                   | Données AD synchronisées entre DC |
| Azure AD             | `New-AzureADUser`                 | Utilisateur créé dans Azure AD    |
| Utilisateurs/Groupes | `New-ADUser`, `New-ADGroup`       | Objets créés et assignés          |
| OU                   | `New-ADOrganizationalUnit`        | Structure hiérarchique créée      |
| Propriétés           | `Set-ADUser`, `Disable-ADAccount` | Attributs modifiés                |

