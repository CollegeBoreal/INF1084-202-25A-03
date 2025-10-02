<<<<<<< HEAD
﻿# utilisateurs4.ps1 - Script 4
Write-Host "=== SCRIPT 4 : EXPORT/IMPORT CSV ===" -ForegroundColor Blue

=======
﻿# Utilisateurs4.ps1 - Export/Import CSV
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
<<<<<<< HEAD
    @{Nom="Moreau"; Prenom="Luc"; Login="lmoreau"; OU="Stagiaires"},
    @{Nom="Petit"; Prenom="Marie"; Login="mpetit"; OU="Formateurs"}
)

$TempPath = "C:\Temp"
if (!(Test-Path $TempPath)) {
    New-Item -ItemType Directory -Path $TempPath -Force
    Write-Host "Dossier C:\Temp cree" -ForegroundColor Green
}

$ExportPath = "$TempPath\UsersSimules.csv"
$Users | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Host "Fichier exporte : $ExportPath" -ForegroundColor Yellow

$ImportedUsers = Import-Csv -Path $ExportPath
Write-Host "`nUtilisateurs importes depuis CSV :" -ForegroundColor Green
$ImportedUsers | Format-Table

$Groups = @{"ImportGroupe" = @()}
foreach ($User in $ImportedUsers) {
    $Groups["ImportGroupe"] += @{
        Nom = $User.Nom
        Prenom = $User.Prenom
        Login = $User.Login
        OU = $User.OU
    }
}

Write-Host "`nMembres du groupe ImportGroupe :" -ForegroundColor Cyan
$Groups["ImportGroupe"] | ForEach-Object { 
    "$($_.Prenom) $($_.Nom)" 
}

Write-Host "`n=== TOUS LES SCRIPTS TERMINES ===" -ForegroundColor White -BackgroundColor DarkGreen
Write-Host "Appuyez sur Entree pour fermer..." -ForegroundColor Yellow
pause
=======
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)

# Export CSV
$Users | Export-Csv -Path "UsersSimules.csv" -NoTypeInformation
Write-Host "Fichier CSV exporté: UsersSimules.csv" -ForegroundColor Green

# Import CSV
$ImportedUsers = Import-Csv -Path "UsersSimules.csv"
Write-Host "`nUtilisateurs importés:" -ForegroundColor Yellow
$ImportedUsers | ForEach-Object { Write-Host "- $($_.Prenom) $($_.Nom)" }
>>>>>>> 0b3b6ce3a5ad74d57cb9f59ba993a89cf533e745
