Voila mon README -300147816-

**Etape 01:** J'ai renommé le nom de servur:

Rename-Computer -NewName "DC300147816" -Restart

Le serveur va se redemarrer 

**Etape 02:** J'installe Active Directory:

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

J'ai é�xéécuté la commande suivante pour vérifier l'installation:

![Ma Capture](C:\Users\Amin\300147816\3.VM\images\MM.PNG)
 
**Etape 03:** J'ajoute une nouvelle forêt a mon Active Directory:
Install-ADDSForest `
    -DomainName "DC300147816-00.local" `
    -DomainNetbiosName "DC300147816-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Canada***karim33!" -AsPlainText -Force) `
    -Force
Enfin, je peux me connecter a mon domaine avec le nom d'utilisateur suivant: DC300147816-00\Administrator et le mot de passe de la machine virtuelle: INFRA@2024
![Ma Capture](C:\Users\Amin\300147816\3.VM\images\activedirectory.PNG)
