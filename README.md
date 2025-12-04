<<<<<<< HEAD
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
=======
# INF1084-202-25A-03
INF1084 (202) - Introduction à l'administration des systèmes

## :date: [Épreuves](.epreuves)

| :hash:  | Date   | Épreuves                                           |
|-------- |--------|:---------------------------------------------------|
| :one:   |05-dec  | Finale                                             |

## 🧨 [Évaluations](.evaluations)

| :hash:  | Date   | Evaluations                                        |
|-------- |--------|:---------------------------------------------------|
| :one:   |10-dec  | [0.Lab1](.evaluations/0.Lab1)                      |
| :two:   |10-dec  | [1.Projet](.evaluations/1.Projet)                  |


## :one: [Devoirs](Devoirs)

| :hash:  | Date   | Leçons                                                           | 🎉 Participations | 🏁 Vérifications |
|-------- |--------|:-----------------------------------------------------------------|:------------------|:--------------|
| :one:   |01-sept | [0.PlanDeCours](0.PlanDeCours)                       | [🎉](0.PlanDeCours/.scripts/Participation.md) 👉  â Noter :x:|
| :two:   |08-sept | [0.Tutoriel sur GIT](0.PlanDeCours/README.md#bulb-tutoriel-sur-git) | [🎉](.scripts/Participation.md) 👉  â Noter :x:|
| :three: |15-sept | [1.SSH](1.SSH/.scripts/Participation.md)                     | [🎉](1.SSH/.scripts/Participation.md) 👉  â Noter :x:|
| :four:  |22-sept | [2.Utilisateurs](2.Utilisateurs)              | [🎉](2.Utilisateurs/.scripts/Participation.md) 👉  â Noter :x:|
| :five:  |29-sept | [3.VMs](3.VMs)     | [🎉](3.VMs/.scripts/Participation.md) 👉 â Noter :x: | [🏁](3.VMs/.scripts/Check.md) â Noter :x: 
| :six:   |13-oct  | [4.OUs](4.OUs)     | [🎉](4.OUs/.scripts/Participation.md) 👉 â Noter :x: | [🏁](4.OUs/.scripts/Check.md) â Noter :x: 
| :seven: |27-oct  | [5.Services](5.Services) | [🎉](5.Services/.scripts/Participation.md) 👉 â Noter :x: |  
| :eight: |03-nov  | [6.Objects](6.Objects) | [🎉](6.Objects/.scripts/Participation.md) 👉 â Noter :x: |  
| :eight: |10-nov  | [7.DCs](7.DCs) | [🎉](7.DCs/.scripts/Participation.md) 👉 â Noter :x: |  


# :books: References :zero: 🖼️ 🗒️ 📂

- [ ] Comment vérifier que le `commit` a été fait par le `CLI`
      
`git log --format=fuller -- `:id:`.md`
>>>>>>> origin/main
