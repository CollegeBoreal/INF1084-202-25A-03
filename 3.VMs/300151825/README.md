README - Configuration du Domaine Active Directory
300151825
J'ai renommé le nom de la machine :
Commande PowerShell :
Rename-Computer -NewName "DC300151825" -Restart
Installer le rôle AD DS
Commande PowerShell :
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Résultat :
Success : True | Restart Needed : No | Exit Code : Success
Création du nouveau domaine
Commande PowerShell :
Install-ADDSForest -DomainName "DC300151825-00.local" -DomainNetbiosName "DC300151825-00" -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) -Force
Vérification de la création du serveur
Commande PowerShell :
Get-ADDomain
Résultat :
DNSRoot : DC300151825-00.local
DomainMode : Windows2016Domain
PDCEmulator : DC300151825.DC300151825-00.local
RIDMaster : DC300151825.DC300151825-00.local
Vérification de la forêt AD
Commande PowerShell :
Get-ADForest
Résultat :
Domains : {DC300151825-00.local}
ForestMode : Windows2016Forest
SchemaMaster : DC300151825.DC300151825-00.local
GlobalCatalogs : {DC300151825.DC300151825-00.local}
