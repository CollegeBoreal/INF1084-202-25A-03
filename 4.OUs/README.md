Parfait ! Voici le **TP complet et mis à jour** pour gérer les utilisateurs dans ton domaine **`DC300098957-0.local`**, avec les corrections pour le container `CN=Users` et la création de l’OU `Students`.

---

# **TP : Gestion des utilisateurs Active Directory avec PowerShell**

**Domaine cible :** `DC300098957-0.local`
**Outils :** PowerShell avec module `ActiveDirectory`

---

## **1️⃣ Préparer l’environnement**

```powershell
# Importer le module AD
Import-Module ActiveDirectory

# Vérifier le domaine et les DC
Get-ADDomain -Server "DC300098957-0.local"
Get-ADDomainController -Filter * -Server "DC300098957-0.local"
```

---

## **2️⃣ Liste des utilisateurs du domaine**

```powershell
$domain = "DC300098957-0.local"

Get-ADUser -Filter * -Server $domain -Properties Name, SamAccountName, Enabled |
Where-Object { $_.Enabled -eq $true -and $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName
```

> ⚠️ Remarque : les utilisateurs créés par défaut sont dans **`CN=Users`**, pas dans une OU.

---

## **3️⃣ Créer un nouvel utilisateur**

```powershell
New-ADUser -Name "Alice Dupont" `
           -GivenName "Alice" `
           -Surname "Dupont" `
           -SamAccountName "alice.dupont" `
           -UserPrincipalName "alice.dupont@DC300098957-0.local" `
           -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) `
           -Enabled $true `
           -Path "CN=Users,DC=DC300098957-0,DC=local"
```

---

## **4️⃣ Modifier un utilisateur**

```powershell
Set-ADUser -Identity "alice.dupont" `
           -EmailAddress "alice.dupont@exemple.com" `
           -GivenName "Alice-Marie"
```

---

## **5️⃣ Désactiver un utilisateur**

```powershell
Disable-ADAccount -Identity "alice.dupont"
```

---

## **6️⃣ Réactiver un utilisateur**

```powershell
Enable-ADAccount -Identity "alice.dupont"
```

---

## **7️⃣ Supprimer un utilisateur**

```powershell
Remove-ADUser -Identity "alice.dupont" -Confirm:$false
```

---

## **8️⃣ Rechercher des utilisateurs avec un filtre**

```powershell
Get-ADUser -Filter "GivenName -like 'A*'" -Properties Name, SamAccountName |
Select-Object Name, SamAccountName
```

---

## **9️⃣ Exporter les utilisateurs dans un CSV**

```powershell
Get-ADUser -Filter * -Server $domain -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "C:\TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
```

---

## **10️⃣ Déplacer un utilisateur vers une OU `Students`**

1. Crée l’OU si elle n’existe pas :

```powershell
# Vérifier si l'OU existe
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=DC300098957-0,DC=local"
}
```

2. Déplacer l’utilisateur depuis `CN=Users` :

```powershell
Move-ADObject -Identity "CN=Alice Dupont,CN=Users,DC=DC300098957-0,DC=local" `
              -TargetPath "OU=Students,DC=DC300098957-0,DC=local"
```

3. Vérifier le déplacement :

```powershell
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName
```

---

### ✅ **Bilan du TP**

Après ce TP, l’étudiant saura :

* Lister tous les utilisateurs d’un domaine
* Créer, modifier, activer/désactiver et supprimer des utilisateurs
* Appliquer des filtres et exporter les données
* Déplacer des utilisateurs depuis le container par défaut `CN=Users` vers une OU spécifique

