Ouail Gacem (300148094) & Mohib (300152260)

🎯 Résumé du laboratoire

Dans ce travail, nous avons mis en place—uniquement via PowerShell—une relation d’approbation entre deux domaines Active Directory isolés.
L’objectif était de démontrer la compréhension des mécanismes inter-forêts et la capacité d’automatiser toutes les étapes sans interface graphique.

🖥️ Environnement utilisé
🔵 Domaine 1 — Ouail

Domaine : DC300148094-00.local

NetBIOS : DC300148094-00

DC : DC300148094

🟢 Domaine 2 — Mohib

Domaine : DC300152260-00.local

NetBIOS : DC300152260-00

DC : DC300152260

Chaque VM fonctionne dans une forêt distincte, sans DNS partagé — ce qui rend certains tests impossibles (et donc attendus).

⚙️ Tâches réalisées
✔ Vérification de la communication

Résolution DNS du domaine distant

Test réseau vers le DC opposé

Lecture d’informations AD distantes (nom de domaine, utilisateurs, racine AD)

✔ Mise en place du trust

Exécution de netdom trust pour créer un trust bidirectionnel et transitif

Utilisation de comptes administrateurs distants via Get-Credential

✔ Validation

Lecture du trust avec Get-ADTrust

Vérification avec netdom trust /verify

💡 Comme dans tout environnement isolé, la création réelle du trust échoue.
L’objectif du TP est la méthodologie, pas le résultat final.

📜 Scripts utilisés
🔵 Script d’Ouail : Trust-DC300148094-00.ps1

Test DNS et ping vers Mohib

Récupération d’identifiants distants

Consultation AD du domaine 300152260

Montage d’un PSDrive Active Directory

Tentative de création du trust

Vérification du trust

🟢 Script de Mohib : Trust-DC300152260-00.ps1

Même logique, inversée vers le domaine d’Ouail

Même séquence d’actions : DNS → Ping → AD → Trust → Vérification

(Les scripts complets sont  fournis dans le dépôt Git.)





🖼️ Captures d’écran à fournir

Test de connectivité (Test-Connection)

Fenêtre d’authentification (Get-Credential)

Tentative de création du trust

Vérification (Get-ADTrust et netdom /verify)

<img width="1920" height="1080" alt="Screenshot (162)" src="https://github.com/user-attachments/assets/f2011a73-1161-44e8-9cd0-051813e870b7" />
<img width="1920" height="1080" alt="Screenshot (161)" src="https://github.com/user-attachments/assets/d7be03e9-87c8-425e-bc79-f8a2e1951df5" />


🏁 Conclusion

Ce projet nous a permis de :

Comprendre comment les domaines AD communiquent entre eux

Utiliser PowerShell comme outil principal d’administration

Automatiser l’ensemble du processus de trust

Identifier les prérequis réels nécessaires à une relation d’approbation inter-forêts

Même si le trust ne peut pas être créé dans notre environnement isolé, les scripts démontrent l’intégralité de la procédure administrative exigée.
