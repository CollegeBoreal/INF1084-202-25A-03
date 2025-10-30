🧩 README - Installation et Configuration du Contrôleur de Domaine
Numéro d'identification : 300151825
Ce document décrit les étapes suivies pour installer et configurer Active Directory Domain Services (AD DS) sur un serveur Windows à l’aide de PowerShell.
1️⃣ Renommer la machine

Commande PowerShell :
Rename-Computer -NewName "DC300151825" -Restart

✅ Résultat attendu : le serveur redémarre avec le nouveau nom **DC300151825**.
2️⃣ Installer le rôle AD DS

Commande PowerShell :
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

✅ Résultat : Installation réussie sans redémarrage requis.
Sortie : Success = True | Restart Needed = No | Feature Result = Active Directory Domain Services, Group Policy Management
3️⃣ Créer un nouveau domaine

Commande PowerShell :
Install-ADDSForest -DomainName "DC300151825-00.local" -DomainNetbiosName "DC300151825-00" -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) -Force

✅ Résultat : Domaine créé avec succès sous le nom **DC300151825-00.local**.
4️⃣ Vérifier la création du domaine

Commande PowerShell :
Get-ADDomain

🔍 Exemple de sortie :

DNSRoot                            : DC300151825-00.local
DomainMode                         : Windows2016Domain
PDCEmulator                        : DC300151825.DC300151825-00.local
RIDMaster                          : DC300151825.DC300151825-00.local

5️⃣ Vérifier la forêt Active Directory

Commande PowerShell :
Get-ADForest

🔍 Exemple de sortie :

Domains               : {DC300151825-00.local}
ForestMode            : Windows2016Forest
SchemaMaster          : DC300151825.DC300151825-00.local
GlobalCatalogs        : {DC300151825.DC300151825-00.local}
