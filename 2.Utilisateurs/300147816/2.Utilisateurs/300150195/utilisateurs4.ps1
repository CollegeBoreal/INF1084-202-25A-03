$Users = @(
    [PSCustomObject]@{Nom="Dupont"; Prenom="Alice"; Login="adupont"},
    [PSCustomObject]@{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"},
    [PSCustomObject]@{Nom="Benali"; Prenom="Karim"; Login="kbenali"},
    [PSCustomObject]@{Nom="Martin"; Prenom="Lina"; Login="lmartin"},
    [PSCustomObject]@{Nom="Khelifa"; Prenom="Nacer"; Login="nkhelifa"}
)

# 🔹 Exporter les utilisateurs
$ExportPath = "C:\Temp\UsersSimules.csv"
$Users | Export-Csv -Path $ExportPath -NoTypeInformation -Encoding UTF8
Write-Host "Fichier exporté : $ExportPath"

# 🔹 Importer depuis le CSV
$ImportedUsers = Import-Csv -Path $ExportPath -Encoding UTF8

# 🔹 Créer un groupe ImportGroupe
$Groups = @{}
$Groups["ImportGroupe"] = $ImportedUsers

Write-Host "`n=== Membres du ImportGroupe ==="
foreach ($user in $Groups["ImportGroupe"]) {
    Write-Host "$($user.Prenom) $($user.Nom) - Login: $($user.Login)"
}


