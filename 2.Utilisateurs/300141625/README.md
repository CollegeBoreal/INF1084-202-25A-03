# 🚀 PROJET COMPLET - PowerShell du Début à la Fin

**Auteur:** Mame Fatim  
**ID:** 300141625  
**Cours:** INF1084-202-25A-03

## 📁 ÉTAPE 1: CRÉATION DES DOSSIERS

```powershell
# Navigation vers le dossier Developer
cd C:\Users\mamef\Developer

# Création de l'arborescence complète
mkdir INF1084-202-25A-03
cd INF1084-202-25A-03
mkdir 2.Utilisateurs
cd 2.Utilisateurs
mkdir 300141625
cd 300141625

# Vérification
pwd


# Création de 4 utilisateurs simulés
$utilisateurs = @()

# Utilisateur 1
$user1 = [PSCustomObject]@{
    Prenom = "Alice"
    Nom = "Tremblay"
    Departement = "Informatique"
    Poste = "Developpeur"
}
$utilisateurs += $user1

# Utilisateur 2
$user2 = [PSCustomObject]@{
    Prenom = "Bob"
    Nom = "Gagnon"
    Departement = "Marketing"
    Poste = "Analyste"
}
$utilisateurs += $user2

# Utilisateur 3
$user3 = [PSCustomObject]@{
    Prenom = "Charlie"
    Nom = "Roy"
    Departement = "RH"
    Poste = "Manager"
}
$utilisateurs += $user3

# Utilisateur 4
$user4 = [PSCustomObject]@{
    Prenom = "Diana"
    Nom = "Cote"
    Departement = "Finance"
    Poste = "Comptable"
}
$utilisateurs += $user4

# Affichage
Write-Host "=== LISTE DES 4 UTILISATEURS ===" -ForegroundColor Green
$utilisateurs | Format-Table



# Recréation des utilisateurs
$utilisateurs = @(
    [PSCustomObject]@{Prenom="Alice"; Nom="Tremblay"; Departement="Informatique"; Poste="Developpeur"},
    [PSCustomObject]@{Prenom="Bob"; Nom="Gagnon"; Departement="Marketing"; Poste="Analyste"},
    [PSCustomObject]@{Prenom="Charlie"; Nom="Roy"; Departement="RH"; Poste="Manager"},
    [PSCustomObject]@{Prenom="Diana"; Nom="Cote"; Departement="Finance"; Poste="Comptable"}
)

# Filtrage par département
$informatique = $utilisateurs | Where-Object {$_.Departement -eq "Informatique"}
$marketing = $utilisateurs | Where-Object {$_.Departement -eq "Marketing"}

# Affichage des résultats
Write-Host "=== UTILISATEURS INFORMATIQUE ===" -ForegroundColor Cyan
$informatique | Format-Table

Write-Host "=== UTILISATEURS MARKETING ===" -ForegroundColor Yellow
$marketing | Format-Table



$utilisateurs = @(
    [PSCustomObject]@{Prenom="Alice"; Nom="Tremblay"; Departement="Informatique"; Poste="Developpeur"},
    [PSCustomObject]@{Prenom="Bob"; Nom="Gagnon"; Departement="Marketing"; Poste="Analyste"},
    [PSCustomObject]@{Prenom="Charlie"; Nom="Roy"; Departement="RH"; Poste="Manager"},
    [PSCustomObject]@{Prenom="Diana"; Nom="Cote"; Departement="Finance"; Poste="Comptable"}
)

# Filtre OR (Informatique OU Finance)
$filtreOr = $utilisateurs | Where-Object {
    $_.Departement -eq "Informatique" -or $_.Departement -eq "Finance"
}

Write-Host "=== FILTRE OR (Informatique OU Finance) ===" -ForegroundColor Magenta
$filtreOr | Format-Table

# Tri par nom
$tries = $utilisateurs | Sort-Object Nom
Write-Host "=== TRIÉS PAR NOM ===" -ForegroundColor Green
$tries | Format-Table


$utilisateurs = @(
    [PSCustomObject]@{Prenom="Alice"; Nom="Tremblay"; Departement="Informatique"; Poste="Developpeur"},
    [PSCustomObject]@{Prenom="Bob"; Nom="Gagnon"; Departement="Marketing"; Poste="Analyste"},
    [PSCustomObject]@{Prenom="Charlie"; Nom="Roy"; Departement="RH"; Poste="Manager"},
    [PSCustomObject]@{Prenom="Diana"; Nom="Cote"; Departement="Finance"; Poste="Comptable"}
)

# Export vers CSV
$utilisateurs | Export-Csv -Path "file_utilisateurs1.csv" -NoTypeInformation
Write-Host "✅ Fichier CSV créé: file_utilisateurs1.csv" -ForegroundColor Green

# Import depuis CSV
$utilisateursImportes = Import-Csv -Path "file_utilisateurs1.csv"
Write-Host "=== DONNÉES IMPORTÉES DU CSV ===" -ForegroundColor Blue
$utilisateursImportes | Format-Table

# Compter le nombre d'utilisateurs
$nombre = $utilisateursImportes.Count
Write-Host "Nombre total d'utilisateurs: $nombre" -ForegroundColor Yellow


Write-Host "=== MINI PROJET - GESTION UTILISATEURS ===" -ForegroundColor Red -BackgroundColor White

# Charger les données depuis CSV
if (Test-Path "file_utilisateurs1.csv") {
    $utilisateurs = Import-Csv -Path "file_utilisateurs1.csv"
    Write-Host "✅ Fichier CSV chargé avec succès!" -ForegroundColor Green
} else {
    Write-Host "❌ Fichier CSV non trouvé. Création des données..." -ForegroundColor Red
    $utilisateurs = @(
        [PSCustomObject]@{Prenom="Alice"; Nom="Tremblay"; Departement="Informatique"; Poste="Developpeur"},
        [PSCustomObject]@{Prenom="Bob"; Nom="Gagnon"; Departement="Marketing"; Poste="Analyste"},
        [PSCustomObject]@{Prenom="Charlie"; Nom="Roy"; Departement="RH"; Poste="Manager"},
        [PSCustomObject]@{Prenom="Diana"; Nom="Cote"; Departement="Finance"; Poste="Comptable"}
    )
}

# Menu interactif
do {
    Write-Host "`n=== MENU PRINCIPAL ===" -ForegroundColor Cyan
    Write-Host "1. Afficher tous les utilisateurs"
    Write-Host "2. Filtrer par département" 
    Write-Host "3. Voir les statistiques"
    Write-Host "4. Quitter"
    
    $choix = Read-Host "`nChoisissez une option (1-4)"
    
    switch ($choix) {
        "1" {
            Write-Host "`n=== TOUS LES UTILISATEURS ===" -ForegroundColor Green
            $utilisateurs | Format-Table
        }
        "2" {
            $dept = Read-Host "`nEntrez le département à filtrer"
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
            Write-Host "`n=== STATISTIQUES PAR DÉPARTEMENT ===" -ForegroundColor Magenta
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


#file_utilisateurs1.csv
Prenom,Nom,Departement,Poste
Alice,Tremblay,Informatique,Developpeur
Bob,Gagnon,Marketing,Analyste
Charlie,Roy,RH,Manager
Diana,Cote,Finance,Comptable

#file_etudiants.csv
ID,Prenom,Nom,Cours,Note
300141625,Mame,Fatim,INF1084,A
300141626,Jean,Dupont,INF1084,B
300141627,Marie,Martin,INF1084,A
300141628,Pierre,Leclerc,INF1084,C


# Tester chaque script dans l'ordre
.\utilisateurs1.ps1
.\utilisateurs2.ps1
.\utilisateurs3.ps1
.\utilisateurs4.ps1
.\mini_projet.ps1

# Vérifier les fichiers créés
dir

# Ajouter tous les fichiers
git add .

# Vérifier l'état
git status

# Créer le commit
git commit -m "🎉 PROJET COMPLET - 5 scripts PowerShell avec tous les codes sources"

# Envoyer sur GitHub
git push

# Vérification finale
git status



✅ RÉSULTAT FINAL
Fichiers créés:

utilisateurs1.ps1 (283 bytes)

utilisateurs2.ps1 (803 bytes)

utilisateurs3.ps1 (641 bytes)

utilisateurs4.ps1 (643 bytes)

mini_projet.ps1 (84 bytes)

file_utilisateurs1.csv (154 bytes)

file_etudiants.csv (154 bytes)

README.md (ce fichier)