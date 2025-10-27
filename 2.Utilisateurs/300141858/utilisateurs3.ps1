# --- TP AD - Partie 3 : Requ�tes & filtres ---
$Users = @(
  [pscustomobject]@{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Martin";  Prenom="Yves";   Login="ymartin";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benoit";  Prenom="Awa";    Login="abenoit";  OU="Stagiaires" }
)

"--- Noms commen�ant par 'B' ---"
$Users | Where-Object { $_.Nom -like "B*" } |
  ForEach-Object { "{0} {1}" -f $_.Prenom, $_.Nom }

"--- Utilisateurs dans l'OU 'Stagiaires' ---"
$Users | Where-Object { $_.OU -eq "Stagiaires" } |
  ForEach-Object { "{0} {1}" -f $_.Prenom, $_.Nom }

"--- Exercice 3 : Pr�nom contient 'a' (insensible � la casse) ---"
$Users | Where-Object { $_.Prenom -match '(?i)a' } |
  ForEach-Object { "{0} {1}" -f $_.Prenom, $_.Nom }
