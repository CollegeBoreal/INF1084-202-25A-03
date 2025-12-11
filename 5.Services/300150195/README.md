## README.md — Laboratoire : Services Active Directory
## 1. Introduction

Ce laboratoire fait partie du cours INF1084 – Systèmes d’exploitation du Collège Boréal.
Il vise à manipuler différents services d’Active Directory (AD) à l’aide d’outils d’administration et de scripts PowerShell.
L’ensemble des travaux a été réalisé dans un environnement Windows Server accessible via connexion Bureau à distance.

## 2. Objectifs du laboratoire

Les objectifs étaient les suivants :

Identifier et afficher les services associés à Active Directory.

Vérifier l’état de services critiques tels que NTDS, ADWS ou DFSR.

Lire et analyser les événements NTDS et Netlogon à partir des journaux Windows.

Exporter les événements Active Directory dans un fichier CSV.

Arrêter puis redémarrer un service AD via un script PowerShell.

Utiliser Git pour versionner les scripts et les publier sur GitHub.

## 3. Structure des fichiers remis

Les fichiers ont été déposés dans le dossier :

5.Services/300150195/

## 3.1 Script : services1.ps1

Ce script :

Liste l’ensemble des services en lien avec Active Directory.

Filtre les services par nom ou DisplayName.

Trie les résultats par ordre alphabétique.

Vérifie l’état des services NTDS, ADWS et DFSR.

## 3.2 Script : services2.ps1

Ce script :

Affiche les 20 derniers événements du journal Directory Service (NTDS).

Affiche les 20 derniers événements du journal System, filtrés pour la source Netlogon.

Permet une lecture rapide des logs essentiels au diagnostic AD.

## 3.3 Script : services3.ps1

Ce script :

Utilise Get-WinEvent pour récupérer les événements modernes liés à Directory Service.

Récupère un maximum de 50 événements.

Exporte les données dans un fichier CSV :

C:\Logs\ADLogs.csv

## 3.4 Script : services4.ps1

Ce script :

Arrête le service DFSR.

Vérifie son état après l’arrêt.

Redémarre le service.

Permet de tester la gestion des services à l’aide de PowerShell.

## 4. Fichier généré

ADLogs.csv : fichier contenant l’export des événements Active Directory (NTDS) généré par services3.ps1.

## 5. Commandes Git utilisées

Les scripts ont été versionnés à l’aide des commandes suivantes :

git add .
git commit -m "Ajout des scripts services AD"
git pull --rebase
git push

## 6. Compétences acquises

À travers ce laboratoire, les compétences suivantes ont été développées :

Compréhension du fonctionnement des services de domaine Active Directory.

Lecture, analyse et exportation des journaux NTDS et Netlogon.

Utilisation de PowerShell pour l’administration avancée d’un serveur Windows.

Maîtrise de la gestion de version via Git et GitHub.

Production de scripts fiables pour l’automatisation administrative.

## 7. Auteur

Amel Zourane — 300150195
Programme : Techniques de systèmes informatiques
Collège Boréal – Campus de Toronto
