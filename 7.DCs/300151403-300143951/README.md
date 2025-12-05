# Trust Active Directory Bidirectionnel

## 📋 Informations

**Cours :** INF1084 | **Établissement :** Collège Boréal  
**Étudiants :** Frank (DC-300143951-00) & Justin (DC-300151403-00)

---

## 🎯 Objectif

Établir un trust Active Directory bidirectionnel pour l'authentification croisée entre deux domaines.

---

## 📊 Domaines

| Étudiant | Domaine |
|----------|---------|
| Frank | `DC-300143951-00.local` |
| Justin | `DC-300151403-00.local` |

---

## 🔧 Configuration

### Vérification DNS
```powershell
Resolve-DnsName DC-300143951-00.local
Resolve-DnsName DC-300151403-00.local
```

### Création du Trust
```powershell
netdom trust DC-300143951-00.local /Domain:DC-300151403-00.local `
    /UserD:administrator /PasswordD:* /Add /Realm /TwoWay
```

---

## ✅ Résultats

| Paramètre | Valeur | Statut |
|-----------|--------|--------|
| Direction | BiDirectional | ✓ |
| Type | Realm | ✓ |
| Transitivité | Non | ✓ |

---

## 🔍 Vérification
```powershell
Get-ADTrust -Filter *
netdom trust DC-300143951-00.local /Domain:DC-300151403-00.local /verify
```

---

## 📝 Scripts & Documents

- `trusts1.ps1` - Script Frank
- `trusts2.ps1` - Script Justin  

---

## ✨ Résultat Final

✅ Trust bidirectionnel établi  
✅ Authentification croisée active  
✅ Communication sécurisée confirmée
