# Trust Active Directory Bidirectionnel

## 📋 Informations

 
**Étudiants :** awa (DC-300142072-50) & siga(DC-300144176-01)

---

## 🎯 Objectif

Établir un trust Active Directory bidirectionnel pour l'authentification croisée entre deux domaines.

---

ip 
1-.7.236.203
---

## 🔧 Configuration

### Vérification DNS
```powershell
Resolve-DnsName DC-300142072-50.local
Resolve-DnsName DC-300144176-01local
```


/Capture du projet.PNG"
![Trust Creation Success](/Capture du projet.PNG
---

## 📸 Visualisation des Trusts

### Vue Frank (DC-300143951-00)
![Trust Visibility Frank](./images/visibilitytrst_frank.png)

**Trusts Visibles:**
- Domaine Sortant: DC-300151403-00.local (Realm, Bidirectionnel)

### Vue Justin (DC-300151403-00)
![Trust Visibility Justin](./images/visibilitytrust_justin.png)

**Trusts Visibles:**
- Domaine Sortant: DC-300143951-00.local (Realm, Bidirectionnel)

---

## 🖥️ Interrogation du Domaine Distant

### Accès Cross-Domain
```powershell
Get-ADDomain -Server DC-300151403-00.local -Credential $cred
```

![Cross-Domain Access](./images/access.png)

**Résultat:** Accès réussi au domaine distant avec authentification croisée
justin a bien access au domaine de frand depuis sa machine virtuelle.

---

## ✅ Résultats de Vérification

| Paramètre | Valeur | Statut |
|-----------|--------|--------|
| Direction | BiDirectional | ✓ |
| Type | Realm | ✓ |
| Transitivité | Non | ✓ |
| Accès Cross-Domain | Fonctionnel | ✓ |

---

## 🔍 Commandes de Vérification

```powershell
# Lister tous les trusts
Get-ADTrust -Filter *

# Vérifier la connectivité
netdom trust DC-300143951-00.local /Domain:DC-300151403-00.local /verify
netdom trust DC-300151403-00.local /Domain:DC-300143951-00.local /verify
```

---

## 📝 Scripts & Documents

- `trusts1..ps1` - Script de rapport Frank
- `trusts2.ps1` - Script de rapport Justin

---

## ✨ Résultat Final

✅ Trust bidirectionnel établi avec succès  
✅ Authentification croisée fonctionnelle  
✅ Communication inter-domaines confirmée  
✅ Accès aux ressources cross-domain validé






<img src="images/Capture du projet.PNG" alt="Girl in a jacket" width="500" height="600">
<img src="images/Capture de projet avant le cred.PNG" alt="Girl in a jacket" width="500" height="600">
<img src="images/Capture de projet gred.PNG" alt="Girl in a jacket" width="500" height="600">



