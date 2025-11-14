# --- TP AD - Partie 2 : Groupes simulés ---
# Liste autonome (identique à la fin de la partie 1)
$Users = @(
  [pscustomobject]@{ Nom="Dupont";  Prenom="Alice";  Login="adupont";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Lemoine"; Prenom="Sarah";  Login="slemoine"; OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benali";  Prenom="Karim";  Login="kbenali";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Martin";  Prenom="Yves";   Login="ymartin";  OU="Stagiaires" },
  [pscustomobject]@{ Nom="Benoit";  Prenom="Awa";    Login="abenoit";  OU="Stagiaires" }
)

# Groupes (simulation)
$Groups = @{
  "GroupeFormation" = @()
  "ProfesseursAD"   = @()
}

# Ajouter tous les Stagiaires
$Groups["GroupeFormation"] += $Users | Where-Object { $_.OU -eq "Stagiaires" }

"--- Membres du groupe 'GroupeFormation' ---"
$Groups["GroupeFormation"] | ForEach-Object { "{0} {1} ({2})" -f $_.Prenom, $_.Nom, $_.Login }
