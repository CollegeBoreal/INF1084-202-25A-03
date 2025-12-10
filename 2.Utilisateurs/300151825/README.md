#300151825

# TP : Simulation Active Directory avec PowerShell



### Creation des utilisateurs
```powershell
$Users = @(
    @{Nom="Dupont"; Prenom="Alice"; Login="adupont"; OU="Stagiaires"},
    @{Nom="Lemoine"; Prenom="Sarah"; Login="slemoine"; OU="Stagiaires"},
    @{Nom="Benali"; Prenom="Karim"; Login="kbenali"; OU="Stagiaires"},
    @{Nom="Nguyen"; Prenom="Thierry"; Login="tnguyen"; OU="Stagiaires"},
    @{Nom="Martin"; Prenom="Julie"; Login="jmartin"; OU="Stagiaires"}
)
```

#Afficher les utilisateurs
```powershell
$Users | ForEach-Object { "$($_.Prenom) $($_.Nom) - Login: $($_.Login) - OU: $($_.OU)" }
```

#commande pour régler le probleème de blocage des scripts
```powershell
powershell -ExecutionPolicy Bypass -File .\utilisateurs1.ps1
```

#Le resultat:
```powershell
Alice Dupont - Login: adupont - OU: Stagiaires
Sarah Lemoine - Login: slemoine - OU: Stagiaires
Karim Benali - Login: kbenali - OU: Stagiaires
Thierry Nguyen - Login: tnguyen - OU: Stagiaires
Julie Martin - Login: jmartin - OU: Stagiaires
```

#Creation de groupe:
```powershell
$Groups = @{
    "GroupeFormation" = @()
    "ProfesseursAD" = @()
}
```

# Ajouter tous les utilisateurs dont l'OU = "Stagiaires" dans GroupeFormation
```powershell
foreach ($user in $Users) {
    if ($user.OU -eq "Stagiaires") {
        $Groups["GroupeFormation"] += $user
    }
```
# Lister tous les utilisateurs dont le nom commence par "B"
```powershell
$Users | Where-Object {$_.Nom -like "B*"}
```
# Lister tous les utilisateurs dans l'OU "Stagiaires"
```powershell
$Users | Where-Object {$_.OU -eq "Stagiaires"}
```
# Lister tous les utilisateurs dont le prénom contient "a" (majuscule/minuscule)
```powershell
$Users | Where-Object {$_.Prenom -match "[aA]"}
```

#Resultat:
```powershell
Nom commence par "B" :
Benali Karim - Login: kbenali - OU: Stagiaires

OU "Stagiaires" :
Alice Dupont - Login: adupont - OU: Stagiaires
Sarah Lemoine - Login: slemoine - OU: Stagiaires
Karim Benali - Login: kbenali - OU: Stagiaires
Thierry Nguyen - Login: tnguyen - OU: Stagiaires
Julie Martin - Login: jmartin - OU: Stagiaires

Prénom contenant "a" :
Sarah Lemoine
Karim Benali
Julie Martin

}

```
