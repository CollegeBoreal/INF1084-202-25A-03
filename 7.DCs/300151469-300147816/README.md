**1-Objectif**

Ce script PowerShell (trusts1.ps1) permet de créer un trust bidirectionnel entre deux domaines Active Directory:                                                                                                                                                                                                                                                                       

-Domaine local (Hanane) : DC300147816.local (NetBIOS : DC300147816VM)                                                                                                                                                                                                                                                                                                                

-Domaine distant (Rabia) : DC300151469-00.local (NetBIOS : DC300151469-00)  


Le trust bidirectionnel permet aux utilisateurs des deux domaines de s’authentifier et d’accéder aux ressources de l’autre domaine selon les droits attribués.  

**2- Prérequis**  

- Le module ActiveDirectory doit être installé sur le serveur où le script est exécuté.


  Vérification : Get-Module -ListAvailable ActiveDirectory                                                                                                                                                                                                                                                                                                                     - ---

- Les deux contrôleurs de domaines doivent être joignables via le réseau :
  
        Test de ping : Test-Connection -ComputerName <IP_DomaineDistant>
  <img width="1725" height="173" alt="5" src="https://github.com/user-attachments/assets/20d83491-31f0-461e-83f3-dd326426b64a" />


                                                                                                                                     
- Les comptes administrateurs des deux domaines doivent connaître un mot de passe convenu pour le trust.



 - Le script doit être exécuté en PowerShell administrateur sur le DC local.   

**3-Contenu du script**   


Le script effectue les étapes suivantes : 



- Vérification DNS du domaine distant.


- Ping / test de connectivité vers le contrôleur de domaine distant.


- Saisie du mot de passe du trust (ou utilisation d’un mot de passe temporaire).


- Création du trust bidirectionnel via la commande netdom trust.



- Vérification du trust via Get-ADTrust et netdom trust /verify.                                                                                                                                                                                                                       

**4-Instructions d’utilisation**   


- S’assurer que le mot de passe du trust est identique sur les deux domaines.



- Ouvrir PowerShell en administrateur sur le DC local.


- Lancer le script :

.\trusts1.ps1



- Vérifier que le trust est bien créé :

Get-ADTrust -Filter *

<img width="1604" height="931" alt="3" src="https://github.com/user-attachments/assets/f60769e1-ba35-4d41-b45c-d46ca9984181" />


**Remarque:**

- Il faut verifier la configuration DNS  pour que le trust marche tres bien.
<img width="1431" height="208" alt="1" src="https://github.com/user-attachments/assets/c9991c5a-242e-4f50-a47e-cd0ba5de79e4" />


-De plus la verification suivante est necessaire pour que le trust reussi:

<img width="1868" height="950" alt="2" src="https://github.com/user-attachments/assets/68c0aa7a-bcd7-469a-80cc-58f377dbcac9" />

- On a teste le trust de Rabia vers mon Active Directory [Hanane].









