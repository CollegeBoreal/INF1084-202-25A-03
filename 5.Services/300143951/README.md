
# Active Directory Services Management

Scripts PowerShell pour administrer et surveiller les services Active Directory.

**Cours:** INF1084 | **École:** Collège Boréal | **ID:** 300143951

---

## 📋 Scripts

### services1.ps1 - Lister les services AD
Vérifie l'état des services essentiels (NTDS, ADWS, DFSR, KDC, Netlogon, IsmServ).

```bash
.\services1.ps1
```

**Résultat:** Tous les services sont actifs ✅

---

### services2.ps1 - Afficher les événements
Consulte les 20 derniers événements du répertoire AD.

```bash
.\services2.ps1
```

**Événements observés:**
- Events 700-701: Défragmentation NTDS (140+ exécutions)
- Event 1162: Reconstruction annuaire
- Event 3041: ⚠️ Avertissement Channel Binding Tokens

---

### services3.ps1 - Exporter les logs en CSV
Sauvegarde les 50 derniers événements dans `C:\Logs\ADLogs_[timestamp].csv`.

```bash
.\services3.ps1
```

**Résultat:** `ADLogs_20251210_235447.csv` généré ✅

---

### services4.ps1 - Redémarrer DFSR
Arrête et redémarre le service DFSR avec vérifications (droits admin requis).

```bash
.\services4.ps1
```

**Résultat:** Service redémarré avec succès ✅

---

## ⚠️ Notes Importantes

- **services4.ps1:** Droits administrateur obligatoires
- **Event 3041:** Avertissement sécurité LDAPS → Configurer Channel Binding Tokens
- Exécuter en environnement de test avant production

---

## 📊 Résultats des Tests

| Script | Statut | Notes |
|--------|--------|-------|
| services1.ps1 | ✅ | Tous les services Running |
| services2.ps1 | ✅ | Maintenance normal, 1 avertissement sécurité |
| services3.ps1 | ✅ | CSV exporté correctement |
| services4.ps1 | ✅ | Redémarrage réussi |

---

## 📚 Services AD Surveillés

- **NTDS:** Active Directory Domain Services (cœur)
- **ADWS:** Active Directory Web Services
- **DFSR:** DFS Replication
- **KDC:** Kerberos Key Distribution Center
- **Netlogon:** Service d'authentification
- **IsmServ:** Intersite Messaging

---

## 📖 Ressources

- [Get-Service (PowerShell)](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service)
- [Get-WinEvent](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/get-winevent)
- [Channel Binding Tokens](https://go.microsoft.com/fwlink/?linkid=2102405)

---

**Auteur:** Frank | **Date:** Décembre 2025
