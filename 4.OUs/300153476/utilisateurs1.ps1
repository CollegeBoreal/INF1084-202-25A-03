                                                                                                                                                  Import-Module ActiveDirectory                                                                                                                                                                                                                                                                                                                                                                                                                                                             # Vérifier le domaine et les DC                                                                                                                                                                                                              Get-ADDomain -Server $domainName                                                                                                                                                                                                             Get-ADDomainController -Filter * -Server $domainName                                                                                                                                                                                                                                                        # Importer le module AD                                                                                                                                                                                                                      Import-Module ActiveDirectory                                                                                                                                                                                                                                                                                                                                                                                                                                                             # Vérifier le domaine et les DC                                                                                                                                                                                                              Get-ADDomain -Server $domainName                                                                                                                                                                                                             Get-ADDomainController -Filter * -Server $domainName                                                                                                                                                                                                                                                        #򠀍󐁴󐀽󐀊򠀍󐀢󐀊󐁳򠀍򠀍򠀍򠀍󐀧򠀍򠀍򠀍򠀍y欁ŤŤ# ==========================
#   Informations étudiant
# ==========================

$studentNumber = 30015346
$studentInstance = "00"

# Domaines générés
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# Informations de sécurité
$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

# Import module Active Directory
Import-Module ActiveDirectory
