# ================================
# bootstrap.ps1 - Smail Ikhlef (300146721)
# Domaine: DC300146721_001.local
# ================================

# Identité étudiante
$studentNumber   = 300146721
$studentInstance = '001'      # garder l'underscore dans les noms

# Module AD et vérifications
Import-Module ActiveDirectory

# Vérifier que le domaine et le DC répondent
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName | Select-Object HostName,IPv4Address,Site,IsGlobalCatalog

