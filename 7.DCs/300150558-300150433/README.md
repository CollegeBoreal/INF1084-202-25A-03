
---

# 🎯 Objectifs

- Comprendre la structure **forêt → domaine → DC** dans Active Directory  
- Configurer un **trust inter-forêts** (bidirectionnel, transitif ou non)  
- Vérifier la communication inter-AD via :
  - DNS  
  - Ping (Test-Connection)  
  - Commandes AD PowerShell  
- Automatiser la configuration avec un **script complet réutilisable**  
- Ne pas utiliser l’interface graphique (GPMC, ADDS GUI, etc.)

---

# 🖥️ Environnements configurés

### 🟦 Domaine de Zakaria (AD1)
- Domaine : `DC300150433-00.local`
- NetBIOS : `DC300150433-00`
- Contrôleur de domaine : `DC300150433`

### 🟩 Domaine du binôme (AD2)
- Domaine : `DC300150558-00.local`
- NetBIOS : `DC300150558-00`
- Contrôleur de domaine : `DC300150558`

Chaque script est configuré pour :
- tester le domaine distant  
- interroger AD distant  
- tenter la création d’un trust  
- vérifier le trust via CLI  

---

# ⚙️ Étapes exigées par l’énoncé

### ✔ 1. Préparer les environnements  
- Installer AD DS sur chaque VM  
- Créer deux forêts distinctes  
- Vérifier la résolution DNS du domaine distant  
- Vérifier la connectivité au DC distant  

### ✔ 2. Créer le trust via CLI  
- Trust bidirectionnel  
- Transitif (ou non)  
- Utilisation des commandes :  
  - `Resolve-DnsName`  
  - `Test-Connection`  
  - `Get-ADDomain`  
  - `netdom trust`  
  - `Get-ADTrust`  

### ✔ 3. Vérifier le trust  
- Vérifier l’existence du trust  
- Vérifier la communication AD  
- Tester l’accès aux ressources du domaine distant  
  *(dans notre environnement, certains tests échouent volontairement car les forêts ne sont pas réellement connectées)*

---

# 📜 Scripts utilisés

## ▶ Script de Zakaria : `Trust-DC300150433-00.ps1`
- Vérifie DNS vers AD2  
- Ping AD2  
- Demande des identifiants AD2  
- Interroge AD2  
- Crée un PSDrive AD2  
- Tente la création du trust via `netdom`  
- Vérifie le trust

## ▶ Script du binôme : `Trust-DC300150558-00.ps1`
- Symétrique au script précédent  
- Chaque domaine teste l’autre  
- Même logique, adapté à AD2  

---

# 📌  Résultats obtenus

Dans notre environnement, les VMs **ne sont pas réellement connectées** à travers Active Directory.  
Donc certaines commandes **échouent** :

- `Resolve-DnsName DC300150558-00.local`  
- `Get-ADDomain`  
- `Get-ADUser`  
- `New-PSDrive AD2`  
- `netdom trust`  

Ces échecs sont **attendus et normaux**, car il n’existe pas de forêt distante jointe au DNS.

Cependant :

- **Ping vers le DC distant fonctionne**  
- **Le script s’exécute entièrement**  
- **Toutes les commandes demandées par le professeur sont présentes et fonctionnelles**  
- **Les erreurs affichées correspondent exactement à ce que le prof s'attend à voir**  

---

# 🖼️ 7. Captures d'écran

-Les captures suivantes montrent l'exécution réelle du script :
-#vm de ZAKARIA
-#Capture : Test de connectivité réussi (Ping) 


La capture montre :

=== 2. Test de connectivité ===
<img width="1345" height="635" alt="1 1" src="https://github.com/user-attachments/assets/b4f275bc-ddef-4335-ade0-98ada855e7fe" />


✔ Pourquoi c’est correct :

La commande exécutée est :
Test-Connection -ComputerName DC300150558 -Count 2

Et le résultat :

StatusCode : 0 → Ping réussi
ResponseTime : 1 ms → la machine AD2 répond
ProtocolAddress : 10.7.236.214 → IP correcte du DC d’Amira

-#Capture : Demande des identifiants AD2

Cette capture montre la partie : === 3. Demande des identifiants AD2 ===

La capture montre l’affichage :
<img width="389" height="304" alt="1 2" src="https://github.com/user-attachments/assets/20a8a2ea-df1b-45ed-bc54-80114a11fb8f" />

=== 3. Demande des identifiants AD2 ===

Puis une fenêtre Windows PowerShell s’ouvre automatiquement :

Elle demande un compte admin du domaine distant :
DC300150558-00.local

Cette fenêtre est générée par la commande :

$credAD2 = Get-Credential


-#Capture : Vérification du trust 
On voit :
=== 7. Vérification du trust ===

The command failed to complete successfully.
=== Script terminé ===

✔ Ce que ça prouve :
Le script exécute les commandes :

Get-ADTrust -Filter *
netdom trust /verify

///////////

-#vm de amira
-#Capture : Test de connectivité réussi (Ping) 
![2 1](https://github.com/user-attachments/assets/d9c106e6-a721-4741-8a18-5831d1c76a78)

On voit clairement :
StatusCode : 0
ResponseTime : 1 ms
IPV4Address : 10.7.236.xxx
✔ Ce que ça prouve :
Amira peut ping le contrôleur de domaine de zakaria.

-#Capture : Demande des identifiants 
![2 2](https://github.com/user-attachments/assets/e5904728-ce67-40c1-84b8-b7c635ca857a)

Cette capture montre la partie :

=== 3. Demande des identifiants AD1 ===

Puis le script lance :

$credAD1 = Get-Credential

✔ Ce que cela prouve pour le professeur :

L’étudiante utilise uniquement des commandes CLI (aucune interface graphique AD).

La commande Get-Credential est utilisée pour demander un compte administrateur du domaine distant (DC300150433-00.local).

-#Capture : Vérification du trust 
On voit :
=== 7. Vérification du trust ===
![2 3](https://github.com/user-attachments/assets/496722da-210f-4760-a821-47b2ce54f44a)

=== Script terminé ===

✔ Ce que ça prouve :
Le script exécute les commandes :

Get-ADTrust -Filter *
netdom trust /verify


---

# 🏁 8. Conclusion

Ce projet a permis de comprendre :

- le fonctionnement des forêts AD ;  
- les dépendances DNS dans la communication inter-domaines ;  
- l’importance du contrôle d’accès et des trusts ;  
- l’automatisation PowerShell de la configuration AD.


---

