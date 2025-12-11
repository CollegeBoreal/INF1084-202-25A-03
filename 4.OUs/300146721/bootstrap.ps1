# ================================
# bootstrap.ps1 - Smail Ikhlef (300146721)
# Domaine: DC300146721_001.local
# ================================

# Identité étudiante
$studentNumber   = 300146721
$studentInstance = '001'      # garder l'underscore dans les noms

# Noms du domaine (avec underscore)
$domainName  = "DC${studentNumber}_${studentInstance}.local"
$netbiosName = "DC${studentNumber}_${studentInstance}"

# Mot de passe TP (fourni par le prof)
$plain  = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force


