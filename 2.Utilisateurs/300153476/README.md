# TP : Simulation Active Directory avec PowerShell

## 🎯 Objectifs
- Comprendre la structure AD : utilisateurs, groupes, OU.
- S'exercer aux cmdlets PowerShell pour créer, filtrer et manipuler des objets.
- Se préparer à la création de scripts AD réels.

## 📂 Structure du projet
| Fichier | Description |
|---------|-------------|
| `utilisateurs1.ps1` | Création initiale des utilisateurs simulés |
| `utilisateurs2.ps1` | Manipulation des utilisateurs et filtres |
| `utilisateurs3.ps1` | Exportation et importation CSV |
| `utilisateurs4.ps1` | Création du groupe `ImportGroupe` |
| `MiniProjet.ps1` | Script complet avec utilisateurs `Promo2025` et groupe `Etudiants2025` |
| `UsersSimules.csv` | CSV généré depuis `utilisateurs3.ps1` |
| `Etudiants2025.csv` | CSV généré depuis `MiniProjet.ps1` |

## 📝 Exercices

### 1️⃣ Création d’utilisateurs simulés
```powershell
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }
```

2️⃣ Création de groupes
```
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}
$Groups["GroupeFormation"] += $Users[0]  # Ajouter Alice Dupont
```
3️⃣ Requêtes et filtres
```
# Utilisateurs dont le nom commence par "B"
$Users | Where-Object {$_.Nom -like "B*"}

# Utilisateurs dans l'OU "Stagiaires"
$Users | Where-Object {$_.OU -eq "Stagiaires"}

# Utilisateurs dont le prénom contient "a" ou "A"
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - OU: $($_.OU)"
}
```
4️⃣ Export et import CSV
```
$CsvPath = "C:\Users\300153476\INF1084-202-25A-03\2.Utilisateurs\300153476\UsersSimules.csv"
$Users | Export-Csv -Path $CsvPath -NoTypeInformation

$ImportedUsers = Import-Csv -Path $CsvPath
$ImportGroupe = @()
$ImportGroupe += $ImportedUsers
$ImportGroupe | Format-Table Prenom, Nom, Login, OU -AutoSize
Write-Host "Fichier exporté et groupe ImportGroupe généré."
```
5️⃣ Mini-projet : Script complet
```
$UsersPromo2025 = @(
    @{Nom="Martin"; Prenom="Alice"; Login="amartin"; OU="Promo2025"},
    @{Nom="Durand"; Prenom="Bob"; Login="bdurand"; OU="Promo2025"},
    @{Nom="Lefevre"; Prenom="Carla"; Login="clefevre"; OU="Promo2025"},
    @{Nom="Petit"; Prenom="David"; Login="dpetit"; OU="Promo2025"},
    @{Nom="Moreau"; Prenom="Elodie"; Login="emoreau"; OU="Promo2025"}
)

$Etudiants2025 = @()
$Etudiants2025 += $UsersPromo2025

$CsvPathPromo = "C:\Users\300153476\INF1084-202-25A-03\2.Utilisateurs\300153476\Etudiants2025.csv"
$Etudiants2025 | Export-Csv -Path $CsvPathPromo -NoTypeInformation
$Etudiants2025 | Format-Table Prenom, Nom, Login, OU -AutoSize
Write-Host "Liste exportée vers : $CsvPathPromo"
```
👤 Auteur

Nom : Ramatoulaye Diallo

Email : dialloramatoulayebah@gmail.com


