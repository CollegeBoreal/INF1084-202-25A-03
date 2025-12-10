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
```powershell
# Vérifier la résolution DNS  
Resolve-DnsName DC300133071.DC300142072-50.local
Resolve-DnsName DC300141550.DC300144176. 01 local

# Vérifier la connectivité réseau entre les domaines 
Test-Connection -ComputerName 
Test-Connection -ComputerName  DC300133071.DC300142072-50.count2
localDC300141550.DC300144176. 01 local count 2



Capture de projet gred.PNG
Capture du projet.PNG
Capture de projet avant le cred.PNG
