Description
Ce projet contient des exercices pratiques pour la gestion d'Active Directory et des stratégies de groupe avec PowerShell.

🛠️ Pré-requis
DC Windows Server 2022 avec AD DS installé

Module Active Directory disponible

Module GroupPolicy disponible

VM membre pour tester les partages et RDP

📂 Structure des exercices
🔹 Exercice 1 - Partage de fichiers
Création du dossier C:\SharedResources

Configuration du partage SMB

Gestion des groupes et utilisateurs AD

🔹 Exercice 2 - Stratégie de groupe (GPO)
Création de la GPO MapSharedFolder

Mappage automatique du lecteur Z:

Liaison avec l'OU Students

🚀 Commandes utiles
```powershell

# Vérifier un utilisateur AD
Get-ADUser -Identity "alice.dupont" | Select-Object Name, DistinguishedName

# Importer les modules
Import-Module ActiveDirectory
Import-Module GroupPolicy

# Tester le partage
Get-SmbShare -Name "SharedResources"
```
⚠️ Notes importantes
Exécuter les scripts PowerShell en tant qu'administrateur

Les modules AD et GPO sont uniquement disponibles sur le contrôleur de domaine

Vérifier les chemins et noms de domaine selon votre environnement

📝 Fichiers inclus
utilisateurs1.ps1 - Partage SMB et groupes AD

utilisateurs2.ps1 - Configuration GPO

images/.gitkeep - Dossier pour captures d'écranmon fichier README.md
