# === Entrée telle que tu l'as affichée ===
$raw = @(
    'Alice Dupont - Login: adupont - OU: Stagiaires',
    'Sarah Lemoine - Login: slemoine - OU: Stagiaires',
    'Karim Benali - Login: kbenali - OU: Stagiaires',
    'messi lionel - Login: lm10 - OU: Stagiaires',
    'ronaldo cristiano - Login: cr7 - OU: Stagiaires'
)

# === Conversion -> objets (Prenom, Nom, Login, OU) ===
$Users = foreach ($line in $raw) {
    $p1, $p2 = $line -split ' - Login: ', 2
    $login, $ou = $p2 -split ' - OU: ', 2
    $fn, $ln = $p1 -split '\s+', 2
    [pscustomobject]@{
        Prenom = $fn
        Nom    = $ln
        Login  = $login.Trim()
        OU     = $ou.Trim()
    }
}

# 1) Noms commençant par 'B'
"--- Noms commençant par 'B' ---"
$Users | Where-Object { $_.Nom -like 'B*' } | Select-Object Prenom, Nom, Login, OU

# 2) OU = 'Stagiaires'
"--- OU = 'Stagiaires' ---"
$Users | Where-Object { $_.OU -eq 'Stagiaires' } | Select-Object Prenom, Nom, OU

# 3) Prénom contient 'a' (insensible à la casse)
"--- Prénom contient 'a' (case-insensitive) ---"
$Users | Where-Object { $_.Prenom -match '(?i)a' } | Select-Object Prenom, Nom, Login, OU
