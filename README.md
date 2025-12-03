# Projet AD Trust
Ceci est mon README.md
 Projet : Création d’une relation de confiance entre deux forêts Active Directory (AD Trust)
 Binôme

Étudiant 1 : 300148094

Étudiant 2 : 300152260

 Objectif du projet

Configurer une relation de confiance (trust) entre deux forêts Active Directory, en utilisant uniquement PowerShell, sans interface graphique.

Ce projet permet de comprendre :

La gestion des forêts AD

Les communications DNS entre domaines

Les mécanismes d’authentification inter-forêts

L'automatisation d’actions administratives via PowerShell

 Architecture du projet
Élément	Étudiant
Forêt AD1	DC300152260-00.local
DC AD1	DC300152260.DC300152260-00.local
Forêt AD2	DC300148094-00.local
DC AD2	DC300148094.DC300148094-00.local

Nous avons créé un trust de type Forest, en mode bidirectionnel, entre les deux forêts.

 Structure du dépôt
300148094-300152260/
│── README.md
│── images/
│── script.ps1
└── (autres fichiers si nécessaires)

 Script PowerShell utilisé (script.ps1)

Le script réalise les étapes suivantes :

Import du module Active Directory

Saisie des identifiants AD1 et AD2

Vérification réseau (ping)

Vérification DNS

Interrogation du domaine AD2 (Get-ADDomain, Get-ADUser)

Création d’un PSDrive vers AD2

Création du trust Forest/Bidirectionnel

Vérification du trust (Get-ADTrust, Test-ADTrustRelationship, nltest)

 Étapes réalisées
 Étape 1 : Vérification réseau

Utilisation de Test-Connection

Vérification que chaque DC répond

 Étape 2 : Vérification DNS

Résolution des forêts et DC

Resolve-DnsName pour s’assurer que AD1 connaît AD2

 Étape 3 : Interrogation AD2

Récupération d'informations du domaine

Lecture des utilisateurs distants

 Étape 4 : Navigation annuaire AD2

Création d’un PSDrive AD

Exploration de la structure AD2

 Étape 5 : Création du Trust

Commande New-ADTrust

Trust Forest → Bidirectionnel → ForestWide Auth

 Étape 6 : Vérification du Trust

Get-ADTrust

Test-ADTrustRelationship

nltest /domain_trusts

 Captures d’écran

Toutes les preuves du projet (DNS, ping, trust, etc.) se trouvent dans :

images/

Conclusion

Le trust entre les deux forêts Active Directory a été créé et validé avec succès à l’aide de PowerShell.
Nous avons respecté les contraintes :
 Aucun usage de l’interface graphique
 Scripts automatisables
 Vérification complète du fonctionnement du trust

Ce projet nous a permis de mieux comprendre :

Les relations inter-forêts

Le rôle du DNS dans la communication AD

L’automatisation avec PowerShell

La gestion sécurisée des identifiants AD

Références

Documentation Microsoft ADDS

Cmdlets PowerShell ActiveDirectory

Cours INF1084 — Relations de confiance

https://learn.microsoft.com/en-us/powershell/

https://www.youtube.com/watch?v=YXqqfjjVXmo