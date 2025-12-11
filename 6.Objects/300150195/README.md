## Partage de ressources & RDP via PowerShell

##Dossier : 300150195

Ce projet a pour objectif d’automatiser, à l’aide de PowerShell, la configuration d’un environnement Active Directory comprenant :

Un dossier partagé accessible aux étudiants

Une GPO qui mappe automatiquement le lecteur réseau Z:

L’activation du RDP pour un groupe d’utilisateurs

La création de comptes étudiants

Des tests de validation

## 1️⃣ Pré-requis

Windows Server 2022 installé avec AD DS

Module ActiveDirectory chargé

Import-Module ActiveDirectory


Module GroupPolicy chargé

Import-Module GroupPolicy


Une VM membre du domaine pour tester le partage + RDP

Le fichier 4.OUs/bootstrap.ps1 doit être exécuté (dot-sourcing) pour charger les variables du domaine.

## 2️⃣ Script : Création du dossier partagé

## 📌 Script : utilisateurs1.ps1

Ce script :

Crée le dossier C:\SharedResources

Crée un partage SMB

Crée le groupe AD Students

Crée les utilisateurs Etudiant1 et Etudiant2

Ajoute les utilisateurs au groupe Students

Il permet de préparer les ressources que les utilisateurs utiliseront.

## 3️⃣ Script : GPO pour mapper le lecteur réseau

## 📌 Script : utilisateurs2.ps1

Ce script :

Crée la GPO MapSharedFolder

Lie la GPO à l’OU Students

Configure un script de logon

Mappe automatiquement le lecteur réseau Z: vers le dossier partagé

Résultat : tous les utilisateurs de l’OU Students verront automatiquement le lecteur Z: en se connectant.

## 4️⃣ Script : Activer RDP pour le groupe

## 📌 Script : utilisateurs3.ps1

Ce script :

Active le Remote Desktop (RDP)

Ouvre le Firewall Windows pour RDP

Donne le droit SeRemoteInteractiveLogonRight au groupe Students

Permet aux étudiants de se connecter en RDP à la VM membre

## 5️⃣ Tests à effectuer

Connexion avec un utilisateur du groupe Students

Vérifier que :

Le lecteur réseau Z: apparaît automatiquement

L’utilisateur peut se connecter en RDP

Tester un utilisateur non membre → il ne doit PAS avoir accès.

## 🎓 Avantages pédagogiques

Automatisation complète via PowerShell (AD, partages, RDP, GPO)

Pas besoin d’interface graphique

Scripts reproductibles sur Hyper-V

Approche professionnelle utilisée en administration système
