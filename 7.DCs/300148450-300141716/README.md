# Projet - Relation de confiance entre forêts Active Directory
---
## Objectif du projet
Créer et vérifier une relation de confiance (trust) bidirectionnelle et transitive entre deux forêts Active Directory distinctes :
*   **Forêt Locale :** `[VOTRE_DOMAINE]` (ex: DC300141716-00.local)
*   **Forêt Partenaire :** `[PARTENAIRE_DOMAINE]` (ex: DC300148450-00.local)

Travail entièrement automatisé via PowerShell.

## Étape 1 – Préparation et vérification des prérequis
### Vérification de la résolution DNS et de la connectivité
```powershell
# Vérification DNS
Resolve-DnsName [PARTENAIRE_DOMAINE]

# Test de connectivité réseau
Test-Connection -ComputerName [PARTENAIRE_DOMAINE] -Count 2
# Test avec l'IP du partenaire (si la résolution DNS échoue)
Test-Connection -ComputerName [IP_DU_PARTENAIRE] -Count 2
