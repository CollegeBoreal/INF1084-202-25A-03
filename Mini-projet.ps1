
. "$PSScriptRoot\utilisateurs1.ps1" > $null
# Créer une liste es etudiants
$Users = @(
[PSCustomObject]@{Nom="Meriem"; Prenom="Alice"; Login="mAlice"; OU="Promo2025"},
[PSCustomObject]@{Nom="Zahra"; Prenom="Salima"; Login="zSalima"; OU="Promo2025"},
[PSCustomObject]@{Nom="Hassina"; Prenom="Karim"; Login="hKarim"; OU="Promo2025"},
[PSCustomObject]@{Nom="Baya"; Prenom="nassira"; Login="bNassira"; OU="Promo2025"},

[PSCustomObject]@{Nom="Zerrouki"; Prenom="Wahiba"; Login="Wzerrouki"; OU="Promo2025"}
)
Write-host "`n===Liste des etudiants de la promo2025==="
$Users |Format-Table

# Créer e Groupe
Write-host "`n=== Creer le groupe Etudiants2025==="
$Groups = @{"Etudiants2025"=@()}
Write-host "`n=== Ajouter tous les etudiants de la promo2025 a ce groupe:==="
$Groups["Etudiants2025"] = $Users| Where-Object {$_.OU -eq "Promo2025"}
Write-host "`n===Groupe Etudiants2025 avec ces utilisateurs===" -ForegroundColor Yellow
$Groups["Etudiants2025"]|Format-Table 


# Afficher le contenu du groupe
Write-host "`n===Groupe Etudiants2025==="
$Groups["Etudiants2025"] | ForEach-Object {
    "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)"
}


# Afficher le nombre d'utilisateurs dans le groupe
Write-Host "`nNombre d'utilisateurs dans Etudiants2025 est : $($Groups['Etudiants2025'].Count)" -ForegroundColor Green
# Exporter la liste finale du groupe en CSV
$Groups["Etudiants2025"] | Export-Csv -Path "C:\Temp\Etudiants2025.csv" -NoTypeInformation
Write-Host "`nLe fichier CSV a été exporté vers C:\Temp\Etudiants2025.csv" -ForegroundColor Cyan
# Importer le fichier CSV dans une variable
$ImportedUsers = Import-Csv -Path "C:\Temp\Etudiants2025.csv"
# Afficher le contenu importé
Write-host "`===Le fichier ImportedUsers a ces informations:==="
$ImportedUsers | Format-Table

