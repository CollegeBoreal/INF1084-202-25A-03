# 🔐 Projet : Mise en place d’un Trust Active Directory entre deux domaines  
### Domaine 1 (Sara) : DC300151347-00.local  
### Domaine 2 (Amel) : DC300150195-00.local  

---

## 📌 Objectif du projet  
Créer un *trust bidirectionnel (Two-Way Trust)* entre les deux environnements Active Directory afin de permettre :

- la communication inter-domaines  
- l’authentification entre les deux forêts  
- la consultation des objets AD d’un domaine depuis l'autre  
- la validation de la résolution DNS, Kerberos, ADWS et LDAP

---

# 🧩 1. Configuration DNS  
Chaque domaine doit pouvoir résoudre le contrôleur de domaine distant.

### ✔ Test DNS depuis Sara → Amel
```powershell
Resolve-DnsName DC300150195-00.local
Résultat :

L’adresse IP 10.7.236.211 est correctement résolue
➡ DNS OK

🧩 2. Test de connectivité (Ping)
Test-Connection DC300150195-00.local -Count 2
Résultat :
Le DC d’Amel répond
➡ Réseau OK

🧩 3. Vérification ADDS du domaine distant

Depuis Sara, interrogation du domaine d’Amel :

Get-ADDomain -Server DC300150195-00.local
Résultat attendu :

Informations du domaine retournées
➡ AD Web Services OK
➡ LDAP/Kerberos OK

🧩 4. Création du Trust (Sara → Amel)
netdom trust DC300151347-00.local /Domain:DC300150195-00.local `
/UserD:Administrator /PasswordD:* /Add /Realm /TwoWay
➡ Trust créé avec succès

🧩 5. Vérification du Trust
netdom trust DC300151347-00.local /Domain:DC300150195-00.local /Verify

➡ Vérification OK

🧩 6. Validation du Trust depuis le domaine d’Amel

Amel utilise les identifiants du domaine de Sara :

DC300151347-00\Administrator


Elle interroge ton domaine :

Get-ADDomain -Server DC300151347-00.local
Résultat :

Toutes les informations de ton domaine apparaissent
➡ Communication AD dans les deux sens : OK

🧩 7. (Note importante) PSDrive ActiveDirectory

La commande :

New-PSDrive -PSProvider ActiveDirectory


peut échouer dans un trust entre deux forêts, car
PowerShell ActiveDirectory ne supporte pas les referrals LDAP.

Ce n’est pas une erreur de configuration, mais une limitation Microsoft.

Et cela n’empêche PAS le trust de fonctionner (preuve avec Get-ADDomain et Get-ADUser).

🏁 Conclusion

Tous les objectifs du laboratoire sont atteints :

✔ DNS opérationnel entre les deux domaines

✔ Connectivité réseau validée

✔ Services ADDS accessibles

✔ Authentification inter-domaines fonctionnelle

✔ Trust bidirectionnel créé et vérifié

✔ Consultation des objets AD du domaine distant

✔ Trust totalement opérationnel

👩‍💻 Réalisé par :

Sara Hocine (300151347)
Amel Zourane (300150195)
INF1084 – Active Directory – Collège Boréal
