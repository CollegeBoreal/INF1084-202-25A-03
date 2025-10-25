
Les fichiers n’étaient pas au même emplacement, donc le script Utilisateur2.ps1 ne trouvait pas Utilisateur1.ps1. Il fallait soit donner le chemin complet, soit mettre les deux fichiers dans le même dossier.

TP : Simulation Active Directory avec PowerShell

Objectifs
- Comprendre la structure AD (utilisateurs, groupes, OU)
- S'exercer aux cmdlets PowerShell pour créer, filtrer et manipuler des objets
- Se préparer a la creation de scripts AD reelles

Structure du projet
utilisateurs1.ps1 : Creation initiale des utilisateurs simulés
utilisateurs2.ps1 : Manipulation des utilisateurs et filtres
utilisateurs3.ps1 : Exportation/importation CSV
utilisateurs4.ps1 : Creation du groupe ImportGroupe
MiniProjet.ps1    : Script complet avec utilisateurs Promo2025 et Etudiants2025

Exercices
1. Creation d'utilisateurs simulés
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"}
)
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }

2. Creation de groupes
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}
$Groups["GroupeFormation"] += $Users[0]

3. Requetes et filtres
$Users | Where-Object {$_.Nom -like "B*"}
$Users | Where-Object {$_.OU -eq "Stagiaires"}
$Users | Where-Object { $_.Prenom -match "a" } | ForEach-Object { "$($_.Prenom) $($_.Nom) - OU: $($_.OU)" }

4. Export et import CSV
$CsvPath = "C:\Users\300153476\INF1084-202-25A-03\2.Utilisateurs\300153476\UsersSimules.csv"
$Users | Export-Csv -Path $CsvPath -NoTypeInformation
$ImportedUsers = Import-Csv -Path $CsvPath
$ImportGroupe = @()
$ImportGroupe += $ImportedUsers
$ImportGroupe | Format-Table Prenom, Nom, Login, OU -AutoSize
Write-Host "Fichier exporte et groupe ImportGroupe genere."

5. Mini-projet
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
Write-Host "Liste exportee vers : $CsvPathPromo"

Auteur : Ramatoulaye Diallo
Email : dialloramatoulayebah@gmail.com

