**Gestion Active Directory - INF1084**

😊 **Informations du Projet**

Ce projet contient des scripts PowerShell pour la gestion d'Active Directory dans le cadre du cours INF1084.

↝**Informations d'etudiant**

- Numero d'etudiant : 300147816

- Instance : 25A-03

- Domaine : DC300147816.local

- Nom NetBIOS : DC300147816

😀Scripts Disponibles:

**0. Configuration Initiale (bootstrap.ps1):**
On cree ce fichier en tapant la commande: nano bootstrap.ps1

![Mon bootstrap.ps1](images/hanane.JPG)

- Definit les variables du domaine

- Configure les informations de securite

**1. Vérification Domaine (utilisateurs1.ps1)**
Voici le code de fichier utilisateurs1.ps1:

![Code utilisateurs1.ps1](images/codeutilisateurs1.JPG)

On aura a l'execution :

![resultat utilisateurs1.ps1](images/executionutilisateur1.PNG)
![resultat utilisateurs1.ps1](images/executionutilisateur1suite.PNg)


**2. Liste des utilisateurs du domaine**

Voici le code de fichier utilisateurs2.ps1:

![Code utilisateurs2.ps1](images/codeutilisateur2.JPG)

On aura a l'execution:

![resultat utilisateurs2.ps1](images/executionutilisateur2.PNG)

**3. Créer un nouvel utilisateur**
Voici le code de fichier utilisateurs3.ps1:
![code utilisateurs3.ps1](codeutilisateur3/JPG)
On aura a l'execution:
![Resultat utilisateurs3.ps1](images/executionutilisateur3.PNG)
Si on execute de nouveau le fichier utilisateurs2.ps1, on aura au resultat:
![Resultat de test d'ajout](images/ajoutreussi.PNG)
**4. Modifier un utilisateur**
Voici le code de fichier utilisateurs4.ps1:
![code utilisateurs4.ps1](codeutilisateur4/JPG)
On aura a l'execution:
![Resultat utilisateurs4.ps1](images/executionutilisateur4.ONG)
On peut verifier que la modification est bien faite en executant la commande suivante:
![Resultat de modification](images/modificationreussite.PNG)
