🧱 Configuration du contrôleur de domaine – DC300151825
🖥️ 1. Renommer la machine
Rename-Computer -NewName "DC300151825" -Restart


Cette commande renomme la machine en DC300151825 et redémarre automatiquement le système pour appliquer le changement.

🧩 2. Installer le rôle Active Directory Domain Services (AD DS)
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools


Résultat :

Success : True

Restart Needed : No

Exit Code : Success

Feature Result : Active Directory Domain Services, Group Policy Management

Cette commande installe le rôle AD DS et les outils nécessaires à la gestion de l’Active Directory.

🌐 3. Créer un nouveau domaine

Install-ADDSForest `
  -DomainName "DC300151825-00.local" `
  -DomainNetbiosName "DC300151825-00" `
  -InstallDns:$true `
  -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
  -Force


Cette commande crée une nouvelle forêt Active Directory et un domaine racine nommé DC300151825-00.local.
Elle installe aussi le serveur DNS et définit un mot de passe pour le mode DSRM.

🔍 4. Vérifier la création du domaine
Get-ADDomain


Résultat (extrait) :

DistinguishedName : DC=DC300151825-00,DC=local

DNSRoot : DC300151825-00.local

DomainMode : Windows2016Domain

PDCEmulator : DC300151825.DC300151825-00.local

RIDMaster : DC300151825.DC300151825-00.local

InfrastructureMaster : DC300151825.DC300151825-00.local

UsersContainer : CN=Users,DC=DC300151825-00,DC=local

Cette commande permet de vérifier que le domaine DC300151825-00.local a bien été créé et que le contrôleur de domaine est fonctionnel.

🌳 5. Vérifier la configuration de la forêt Active Directory
Get-ADForest


Résultat (extrait) :

Domains : {DC300151825-00.local}

RootDomain : DC300151825-00.local

ForestMode : Windows2016Forest

GlobalCatalogs : {DC300151825.DC300151825-00.local}

DomainNamingMaster : DC300151825.DC300151825-00.local

SchemaMaster : DC300151825.DC300151825-00.local

Sites : {Default-First-Site-Name}

Cette commande affiche la configuration de la forêt Active Directory, confirmant que le domaine et le catalogue global sont correctement installés.

✅ 6. Conclusion

Le contrôleur de domaine DC300151825 et le domaine DC300151825-00.local ont été créés avec succès.
L’Active Directory et le DNS sont opérationnels et configurés selon les paramètres définis.
