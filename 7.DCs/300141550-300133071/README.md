# TP Active Directory – Vérification inter-domaines
---
## Objectif du laboratoire

Ce laboratoire a pour objectif de vérifier la communication et l’accès entre deux contrôleurs de domaine :

- Vérifier la connectivité réseau entre les domaines  
- Vérifier la résolution DNS  
- Récupérer les informations du domaine distant  
- Naviguer dans l’Active Directory distant via un PSDrive  
- Automatiser tous les tests via un script PowerShell  
---
## Étape 1 – Vérifier la connectivité


Test-Connection -ComputerName DC300133071-00 -Count 2
Resolve-DnsName DC300133071-00.local


Étape 2 – Informations du domaine distant

