
# Identité étudiante
$studentNumber   = 300150558
$studentInstance = '00'      # garder l'underscore dans les noms

# Noms du domaine (avec underscore)
$domainName  = "DC${studentNumber}_${studentInstance}.local"
$netbiosName = "DC${studentNumber}_${studentInstance}"

# Mot de passe TP (fourni par le prof)
$plain  = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force

# Credential admin du domaine
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Module AD et vérifications
Import-Module ActiveDirectory

# Vérifier que le domaine et le DC répondent
Get-ADDomain -Server $domainName
Get-ADDomainController -Filter * -Server $domainName | Select-Object HostName,IPv4Address,Site,IsGlobalCatalog

# S'assurer que l'OU Students existe
if (-not (Get-ADOrganizationalUnit -LDAPFilter '(ou=Students)' -Server $domainName -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local" -Server $domainName -ProtectedFromAccidentalDeletion:$false
}

