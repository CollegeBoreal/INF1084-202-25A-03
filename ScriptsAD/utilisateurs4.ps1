# utilisateurs4.ps1 - Script 4
Write-Host "=== SCRIPT 4 : EXPORT/IMPORT CSV ===" -ForegroundColor Blue

$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
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
