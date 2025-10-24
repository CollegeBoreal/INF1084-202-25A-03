# 🚀 PROJET POWERHSHELL - GUIDE COMPLET

Auteur: Mame Fatim
ID: 300141625
Cours: INF1084-202-25A-03

## 📁 STRUCTURE DU PROJET
300141625/
├── 📄 README.md
├── 🔧 utilisateurs1.ps1
├── 🔧 utilisateurs2.ps1
├── 🔧 utilisateurs3.ps1
├── 🔧 utilisateurs4.ps1
├── 🔧 mini_projet.ps1
├── 📊 file_utilisateurs1.csv
└── 📊 file_etudiants.csv

## 🛠️ ÉTAPE 1: CRÉATION DOSSIERS
cd C:\Users\mamef\Developer
mkdir INF1084-202-25A-03
cd INF1084-202-25A-03
mkdir 2.Utilisateurs
cd 2.Utilisateurs
mkdir 300141625
cd 300141625

## 📝 ÉTAPE 2: SCRIPT 1 - utilisateurs1.ps1
notepad utilisateurs1.ps1

CONTENU:
$utilisateurs = @()
$user1 = [PSCustomObject]@{Prenom="Alice";Nom="Tremblay";Departement="Informatique";Poste="Developpeur"}
$utilisateurs += $user1
$user2 = [PSCustomObject]@{Prenom="Bob";Nom="Gagnon";Departement="Marketing";Poste="Analyste"}
$utilisateurs += $user2
$user3 = [PSCustomObject]@{Prenom="Charlie";Nom="Roy";Departement="RH";Poste="Manager"}
$utilisateurs += $user3
$user4 = [PSCustomObject]@{Prenom="Diana";Nom="Cote";Departement="Finance";Poste="Comptable"}
$utilisateurs += $user4
Write-Host "=== LISTE DES 4 UTILISATEURS ===" -ForegroundColor Green
$utilisateurs | Format-Table

## 🔍 ÉTAPE 3: SCRIPT 2 - utilisateurs2.ps1
notepad utilisateurs2.ps1

CONTENU:
$utilisateurs = @(
[PSCustomObject]@{Prenom="Alice";Nom="Tremblay";Departement="Informatique";Poste="Developpeur"},
[PSCustomObject]@{Prenom="Bob";Nom="Gagnon";Departement="Marketing";Poste="Analyste"},
[PSCustomObject]@{Prenom="Charlie";Nom="Roy";Departement="RH";Poste="Manager"},
[PSCustomObject]@{Prenom="Diana";Nom="Cote";Departement="Finance";Poste="Comptable"}
)
$informatique = $utilisateurs | Where-Object {$_.Departement -eq "Informatique"}
$marketing = $utilisateurs | Where-Object {$_.Departement -eq "Marketing"}
Write-Host "=== UTILISATEURS INFORMATIQUE ===" -ForegroundColor Cyan
$informatique | Format-Table
Write-Host "=== UTILISATEURS MARKETING ===" -ForegroundColor Yellow
$marketing | Format-Table

## ⚡ ÉTAPE 4: SCRIPT 3 - utilisateurs3.ps1
notepad utilisateurs3.ps1

CONTENU:
$utilisateurs = @(
[PSCustomObject]@{Prenom="Alice";Nom="Tremblay";Departement="Informatique";Poste="Developpeur"},
[PSCustomObject]@{Prenom="Bob";Nom="Gagnon";Departement="Marketing";Poste="Analyste"},
[PSCustomObject]@{Prenom="Charlie";Nom="Roy";Departement="RH";Poste="Manager"},
[PSCustomObject]@{Prenom="Diana";Nom="Cote";Departement="Finance";Poste="Comptable"}
)
$filtreOr = $utilisateurs | Where-Object {$_.Departement -eq "Informatique" -or $_.Departement -eq "Finance"}
Write-Host "=== FILTRE OR (Informatique OU Finance) ===" -ForegroundColor Magenta
$filtreOr | Format-Table
$tries = $utilisateurs | Sort-Object Nom
Write-Host "=== TRIÉS PAR NOM ===" -ForegroundColor Green
$tries | Format-Table

## 📊 ÉTAPE 5: SCRIPT 4 - utilisateurs4.ps1
notepad utilisateurs4.ps1

CONTENU:
$utilisateurs = @(
[PSCustomObject]@{Prenom="Alice";Nom="Tremblay";Departement="Informatique";Poste="Developpeur"},
[PSCustomObject]@{Prenom="Bob";Nom="Gagnon";Departement="Marketing";Poste="Analyste"},
[PSCustomObject]@{Prenom="Charlie";Nom="Roy";Departement="RH";Poste="Manager"},
[PSCustomObject]@{Prenom="Diana";Nom="Cote";Departement="Finance";Poste="Comptable"}
)
$utilisateurs | Export-Csv -Path "file_utilisateurs1.csv" -NoTypeInformation
Write-Host "✅ Fichier CSV créé: file_utilisateurs1.csv" -ForegroundColor Green
$utilisateursImportes = Import-Csv -Path "file_utilisateurs1.csv"
Write-Host "=== DONNÉES IMPORTÉES DU CSV ===" -ForegroundColor Blue
$utilisateursImportes | Format-Table
$nombre = $utilisateursImportes.Count
Write-Host "Nombre total d'utilisateurs: $nombre" -ForegroundColor Yellow

## 🏆 ÉTAPE 6: SCRIPT 5 - mini_projet.ps1
notepad mini_projet.ps1

CONTENU:
Write-Host "=== MINI PROJET - GESTION UTILISATEURS ===" -ForegroundColor Red -BackgroundColor White
if (Test-Path "file_utilisateurs1.csv") {
$utilisateurs = Import-Csv -Path "file_utilisateurs1.csv"
Write-Host "✅ Fichier CSV chargé avec succès!" -ForegroundColor Green
} else {
$utilisateurs = @(
[PSCustomObject]@{Prenom="Alice";Nom="Tremblay";Departement="Informatique";Poste="Developpeur"},
[PSCustomObject]@{Prenom="Bob";Nom="Gagnon";Departement="Marketing";Poste="Analyste"},
[PSCustomObject]@{Prenom="Charlie";Nom="Roy";Departement="RH";Poste="Manager"},
[PSCustomObject]@{Prenom="Diana";Nom="Cote";Departement="Finance";Poste="Comptable"}
)
}
do {
Write-Host "=== MENU PRINCIPAL ===" -ForegroundColor Cyan
Write-Host "1. Afficher tous les utilisateurs"
Write-Host "2. Filtrer par département" 
Write-Host "3. Voir les statistiques"
Write-Host "4. Quitter"
$choix = Read-Host "Choisissez une option (1-4)"
switch ($choix) {
"1" {
Write-Host "=== TOUS LES UTILISATEURS ===" -ForegroundColor Green
$utilisateurs | Format-Table
}
"2" {
$dept = Read-Host "Entrez le département à filtrer"
$resultats = $utilisateurs | Where-Object {$_.Departement -eq $dept}
if ($resultats) {
Write-Host "=== RÉSULTATS POUR $dept ===" -ForegroundColor Yellow
$resultats | Format-Table
} else {
Write-Host "❌ Aucun utilisateur trouvé dans ce département" -ForegroundColor Red
}
}
"3" {
$stats = $utilisateurs | Group-Object Departement
Write-Host "=== STATISTIQUES PAR DÉPARTEMENT ===" -ForegroundColor Magenta
$stats | Format-Table Name, Count
}
"4" {
Write-Host "👋 Au revoir!" -ForegroundColor Green
}
default {
Write-Host "❌ Choix invalide! Veuillez choisir 1-4." -ForegroundColor Red
}
}
} while ($choix -ne "4")

## 📄 ÉTAPE 7: FICHIERS CSV
notepad file_utilisateurs1.csv

CONTENU:
Prenom,Nom,Departement,Poste
Alice,Tremblay,Informatique,Developpeur
Bob,Gagnon,Marketing,Analyste
Charlie,Roy,RH,Manager
Diana,Cote,Finance,Comptable

notepad file_etudiants.csv

CONTENU:
ID,Prenom,Nom,Cours,Note
300141625,Mame,Fatim,INF1084,A
300141626,Jean,Dupont,INF1084,B
300141627,Marie,Martin,INF1084,A
300141628,Pierre,Leclerc,INF1084,C

## 🧪 ÉTAPE 8: TEST DES SCRIPTS
.\utilisateurs1.ps1
.\utilisateurs2.ps1
.\utilisateurs3.ps1
.\utilisateurs4.ps1
.\mini_projet.ps1

## 🚀 ÉTAPE 9: ENVOI SUR GITHUB
git add .
git commit -m "🎉 PROJET COMPLET - 5 scripts PowerShell"
git push

## ✅ RÉSULTAT FINAL
8 fichiers créés avec succès!
Tous les codes disponibles sur GitHub.
Projet terminé! 🎊