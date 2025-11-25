# 📘 TP : Simulation Active Directory avec PowerShell

**Étudiant : 300150433 — Zakaria Djellouli**

---

## 🎯 Objectifs du TP

Ce travail pratique a pour but de :

* Comprendre la structure Active Directory (utilisateurs, groupes, OUs).
* Manipuler des objets AD simulés via PowerShell.
* S’exercer aux cmdlets de filtrage, manipulation de données, et export CSV.
* Apprendre à structurer un mini-projet PowerShell.

Les scripts sont nommés selon le format requis :
**utilisateurs1.ps1 → utilisateurs4.ps1**

---

# 🟦 1. utilisateurs1.ps1 — Création d’utilisateurs simulés

### ✔ Objectif

Créer une liste d’utilisateurs sous forme de hashtable et les afficher.

```powershell
# Créer une liste d'utilisateurs simulés
$Users = @(
    @{ Nom="Dupont";  Prenom="Alice";  Login="adupont";    OU="Stagiaires" },
    @{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine";   OU="Stagiaires" },
    @{ Nom="Benali";  Prenom="Karim";  Login="kbenali";    OU="Stagiaires" },
    @{ Nom="Djellouli"; Prenom="Zakaria"; Login="zdjellouli"; OU="Promo2025" },
    @{ Nom="Hocine";  Prenom="Sara";   Login="shocine";    OU="Stagiaires" }
)

# Afficher les utilisateurs
$Users | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}
```

### ✔ Résultat

Les 5 utilisateurs s’affichent correctement, dont 2 ajoutés pour l’exercice.

---

# 🟩 2. utilisateurs2.ps1 — Création et gestion de groupes

### ✔ Objectif

Créer des groupes, ajouter des utilisateurs selon leur OU.

```powershell
# Créer des groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD"   = @()
}

# Ajouter un utilisateur exemple
$Groups["GroupeFormation"] += $Users[0]

# Ajouter tous les utilisateurs de l'OU 'Stagiaires'
foreach ($user in $Users) {
    if ($user.OU -eq "Stagiaires") {
        $Groups["GroupeFormation"] += $user
    }
}

# Afficher les groupes
foreach ($group in $Groups.GetEnumerator()) {
    Write-Host "`nGroupe : $($group.Key)"
    foreach ($member in $group.Value) {
        Write-Host " - $($member.Prenom) $($member.Nom) - Login: $($member.Login)"
    }
}
```

### ✔ Résultat

Tous les stagiaires sont inclus dans **GroupeFormation**.

---

# 🟨 3. utilisateurs3.ps1 — Filtres et requêtes

### ✔ Objectif

Appliquer des filtres PowerShell : par lettre, par OU, par caractère dans le prénom.

```powershell
# Noms commençant par B
$Users | Where-Object { $_.Nom -like "B*" }

# Utilisateurs dans l'OU Stagiaires
$Users | Where-Object { $_.OU -eq "Stagiaires" }

# Prénoms contenant 'a' (ignore case)
$Users | Where-Object { $_.Prenom -match "(?i)a" }
```

### ✔ Résultat

Le script affiche les utilisateurs correspondant à chaque filtre.

---

# 🟦 4. utilisateurs4.ps1 — Export / Import CSV et groupe ImportGroupe

### ✔ Objectif

Exporter les utilisateurs, les réimporter et créer un groupe basé sur le CSV.

```powershell
# Export CSV
$Users | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation

# Import CSV
$ImportedUsers = Import-Csv -Path "C:\Temp\UsersSimules.csv"

# Création du groupe ImportGroupe
$Groups = @{ "ImportGroupe" = @() }

foreach ($user in $ImportedUsers) {
    $Groups["ImportGroupe"] += $user
}

# Affichage final
$Groups["ImportGroupe"] | ForEach-Object {
    Write-Host "$($_.Prenom) $($_.Nom) - Login: $($_.Login)"
}
```

### ✔ Résultat

Le fichier CSV est importé et tous les utilisateurs importés sont ajoutés dans **ImportGroupe**.

---


# ✅ Conclusion

Ce TP m’a permis de :

* Manipuler des objets AD simulés avec PowerShell
* Utiliser des filtres avancés (`-like`, `-match`, conditions…)
* Exporter et importer des données en CSV
* Structurer un mini-projet complet autour des utilisateurs et groupes

Tous les scripts fonctionnent et respectent les consignes du travail.

---

