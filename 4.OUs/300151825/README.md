300151825

0️⃣ Nom du domaine basé sur le numéro étudiant

$studentNumber = 300151825
$studentInstance = 00

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"


$domainName
DC300151825-0.local

$netbiosName
DC300151825-0


1️⃣ Préparer l’environnement

# Importer le module AD
Import-Module ActiveDirectory
# Vérifier le domaine et les DC
Get-ADDomain -Server $domainName

AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=DC300151825-00,DC=local
DeletedObjectsContainer            : CN=Deleted Objects,DC=DC300151825-00,DC=local
DistinguishedName                  : DC=DC300151825-00,DC=local
DNSRoot                            : DC300151825-00.local
DomainControllersContainer         : OU=Domain Controllers,DC=DC300151825-00,DC=local
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-447135690-91861430-3213525697
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=DC300151825-00,DC=local
Forest                             : DC300151825-00.local
InfrastructureMaster               : DC300151825.DC300151825-00.local
LastLogonReplicationInterval       :
LinkedGroupPolicyObjects           : {CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=DC300151825-00
                                     ,DC=local}
LostAndFoundContainer              : CN=LostAndFound,DC=DC300151825-00,DC=local
ManagedBy                          :
Name                               : DC300151825-00
NetBIOSName                        : DC300151825-00
ObjectClass                        : domainDNS
ObjectGUID                         : 6a8d72e4-ba5c-40ad-a8c5-d9e16cf7e0aa
ParentDomain                       :
PDCEmulator                        : DC300151825.DC300151825-00.local
PublicKeyRequiredPasswordRolling   : True
QuotasContainer                    : CN=NTDS Quotas,DC=DC300151825-00,DC=local
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {DC300151825.DC300151825-00.local}
RIDMaster                          : DC300151825.DC300151825-00.local
SubordinateReferences              : {DC=ForestDnsZones,DC=DC300151825-00,DC=local,
                                     DC=DomainDnsZones,DC=DC300151825-00,DC=local,
                                     CN=Configuration,DC=DC300151825-00,DC=local}
SystemsContainer                   : CN=System,DC=DC300151825-00,DC=local
UsersContainer                     : CN=Users,DC=DC300151825-00,DC=local



Get-ADDomainController -Filter * -Server $domainName


ComputerObjectDN           : CN=DC300151825,OU=Domain Controllers,DC=DC300151825-00,DC=local
DefaultPartition           : DC=DC300151825-00,DC=local
Domain                     : DC300151825-00.local
Enabled                    : True
Forest                     : DC300151825-00.local
HostName                   : DC300151825.DC300151825-00.local
InvocationId               : 79cc5764-addd-4353-86a8-2ab9407a4eb4
IPv4Address                : 10.7.236.217
IPv6Address                :
IsGlobalCatalog            : True
IsReadOnly                 : False
LdapPort                   : 389
Name                       : DC300151825
NTDSSettingsObjectDN       : CN=NTDS Settings,CN=DC300151825,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configur
                             ation,DC=DC300151825-00,DC=local
OperatingSystem            : Windows Server 2022 Datacenter
OperatingSystemHotfix      :
OperatingSystemServicePack :
OperatingSystemVersion     : 10.0 (20348)
OperationMasterRoles       : {SchemaMaster, DomainNamingMaster, PDCEmulator, RIDMaster...}
Partitions                 : {DC=ForestDnsZones,DC=DC300151825-00,DC=local,
                             DC=DomainDnsZones,DC=DC300151825-00,DC=local,
                             CN=Schema,CN=Configuration,DC=DC300151825-00,DC=local,
                             CN=Configuration,DC=DC300151825-00,DC=local...}
ServerObjectDN             : CN=DC300151825,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=DC300151
                             825-00,DC=local
ServerObjectGuid           : b22c4f6c-93cd-4a6a-8c55-9dd50aa231ea
Site                       : Default-First-Site-Name
SslPort                    : 636


2️⃣ Liste des utilisateurs du domaine

Get-ADUser -Filter *

DistinguishedName : CN=Administrator,CN=Users,DC=DC300151825-00,DC=local
Enabled           : True
GivenName         :
Name              : Administrator
ObjectClass       : user
ObjectGUID        : e3446fb9-d47f-4019-b788-45dfb89f9d49
SamAccountName    : Administrator
SID               : S-1-5-21-447135690-91861430-3213525697-500
Surname           :
UserPrincipalName :

DistinguishedName : CN=Guest,CN=Users,DC=DC300151825-00,DC=local
GivenName         :
Name              : Guest
ObjectClass       : user
ObjectGUID        : af6c170e-1d6f-4538-95e0-2c3951223ba7
SamAccountName    : Guest
SID               : S-1-5-21-447135690-91861430-3213525697-501
Surname           :
UserPrincipalName :

DistinguishedName : CN=student1,CN=Users,DC=DC300151825-00,DC=local
Enabled           : True
GivenName         :
Name              : student1
ObjectClass       : user
ObjectGUID        : ad0f59a5-6416-4c54-8153-2bf3cc8b59dc
SamAccountName    : student1
SID               : S-1-5-21-447135690-91861430-3213525697-1000
Surname           :
UserPrincipalName :

DistinguishedName : CN=krbtgt,CN=Users,DC=DC300151825-00,DC=local
Enabled           : False
GivenName         :
Name              : krbtgt

ObjectClass       : user
ObjectGUID        : cefcd677-c3cc-4e63-bb7b-28cdf96b3dff
SamAccountName    : krbtgt
SID               : S-1-5-21-447135690-91861430-3213525697-502
Surname           :
UserPrincipalName :


3️⃣ Créer un nouvel utilisateur

New-ADUser `
  -Name "Leandre Ebah" `
  -GivenName "Leandre" `
  -Surname "Ebah" `
  -SamAccountName "leandre.ebah" `
  -UserPrincipalName "leandre.ebah@DC300151825-00.local" `
  -Path "CN=Users,DC=DC300151825-00,DC=local" `
  -AccountPassword (Read-Host -Prompt "Entrer le mot de passe pour Leandre Ebah" -AsSecureString) `
  -Enabled $true `
  -Credential $cred


4️⃣ Modifier un utilisateur

  Set-ADUser -Identity "leandre.ebah" `
           -EmailAddress "leandre.ebah@DC300151825-00.local" `
           -GivenName "Leandre-Freedy" `
           -Credential $cred


5️⃣ Désactiver un utilisateur

Disable-ADAccount -Identity "Leandre.ebah" -Credential $cred


6️⃣ Réactiver un utilisateur

Enable-ADAccount -Identity "Leandre.ebah" -Credential $cred


7️⃣ Supprimer un utilisateur
Remove-ADUser -Identity "Leandre.ebah" -Confirm:$false -Credential $cred


8️⃣ Rechercher des utilisateurs avec un filtre

 Get-ADUser -Filter "GivenName -like 'T*'"

 DistinguishedName : CN=Thomas Girard,CN=Users,DC=DC300151825-00,DC=local
Enabled           : True
GivenName         : Thomas
Name              : Thomas Girard
ObjectClass       : user
ObjectGUID        : 24e77299-dfc6-428b-889e-c29e89d063ef
SamAccountName    : thomas.girard
SID               : S-1-5-21-447135690-91861430-3213525697-1107
Surname           : Girard
UserPrincipalName : thomas.girard@DC300151825-00.local


9️⃣ Exporter les utilisateurs dans un CSV

Get-ADUser -Filter * -Server "DC300151825-00.local" -Properties Name, SamAccountName, EmailAddress, Enabled |
Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name, SamAccountName, EmailAddress, Enabled |
Export-Csv -Path "C:\Users\Student1\INF1084-202-25A-03\4.OUs\300151825\TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8


10️⃣ Déplacer un utilisateur vers une OU Students

1. Crée l’OU si elle n’existe pas :

# Vérifier si l'OU Students existe, sinon la créer
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Students'")) {
    New-ADOrganizationalUnit -Name "Students" -Path "DC=$netbiosName,DC=local" -Credential $cred
    Write-Host "OU 'Students' créée avec succès ✅"
} else {
    Write-Host "OU 'Students' existe déjà."
}

OU 'Students' créée avec succès

2. Déplacer l’utilisateur depuis CN=Users :

Move-ADObject -Identity "CN=Thomas Girard,CN=Users,DC=$netbiosName,DC=local" `
              -TargetPath "OU=Students,DC=$netbiosName,DC=local" `
              -Credential $cred

3. Vérifier le déplacement :

Get-ADUser -Identity "thomas.girard" | Select-Object Name, DistinguishedName

Name          DistinguishedName
----          -----------------
Thomas Girard CN=Thomas Girard,OU=Students,DC=DC300151825-00,DC=local
