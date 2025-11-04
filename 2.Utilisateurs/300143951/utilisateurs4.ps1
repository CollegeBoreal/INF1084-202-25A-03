# utilisateurs4_simple.ps1 - Version simplifiée sans problèmes de guillemets

# Charger les utilisateurs
Write-Host "=== CHARGEMENT DES DONNEES ===" -ForegroundColor Cyan
$Users = .\utilisateurs1.ps1

# Créer C:\Temp si nécessaire
if (!(Test-Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null
}

# Convertir en objets pour Export-CSV
$UsersObjects = @()
foreach ($u in $Users) {
    $obj = New-Object PSObject
    $obj | Add-Member -MemberType NoteProperty -Name "Nom" -Value $u.Nom
    $obj | Add-Member -MemberType NoteProperty -Name "Prenom" -Value $u.Prenom
    $obj | Add-Member -MemberType NoteProperty -Name "Login" -Value $u.Login
    $obj | Add-Member -MemberType NoteProperty -Name "OU" -Value $u.OU
    $UsersObjects += $obj
}

# Export CSV
Write-Host "=== EXPORT CSV ===" -ForegroundColor Yellow
$UsersObjects | Export-Csv -Path "C:\Temp\UsersSimules.csv" -NoTypeInformation
Write-Host "Export OK vers C:\Temp\UsersSimules.csv" -ForegroundColor Green

# Import CSV
Write-Host "=== IMPORT CSV ===" -ForegroundColor Yellow
$Imported = Import-Csv -Path "C:\Temp\UsersSimules.csv"
$Imported | Format-Table

# Créer groupe avec les utilisateurs importés
$ImportGroupe = @{
    Name = "ImportGroupe"
    Members = $Imported
}

Write-Host "=== GROUPE CREE ===" -ForegroundColor Magenta
Write-Host "Groupe: ImportGroupe"
Write-Host "Membres: $($ImportGroupe.Members.Count)"
Write-Host "Liste:"
foreach ($m in $ImportGroupe.Members) {
    Write-Host ("  - " + $m.Prenom + " " + $m.Nom)
}

Write-Host "=== TERMINE ===" -ForegroundColor Green
