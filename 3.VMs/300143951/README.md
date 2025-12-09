# Configuration Active Directory - Machine Virtuelle

## 📋 Informations Générales

**Environnement :** Windows Server avec Active Directory Domain Services  
**Domaine :** `DC-300143951-00.local`  
**Contrôleur de Domaine :** `DC-300143951.DC-300143951-00.local`

---

## 🖥️ Accès à la Machine Virtuelle

### Prérequis
- PowerShell 5.1 ou supérieur
- Droits administrateur sur le contrôleur de domaine
- Accès réseau au domaine

### Connexion
```powershell
# Se connecter en tant qu'administrateur
Enter-PSSession -ComputerName DC-300143951 -Credential DC-300143951-00\Administrator
```

---

## 🌳 Configuration du Domaine Active Directory

### Commandes de Diagnostic

Pour vérifier la configuration du domaine :

```powershell
Get-ADDomain
Get-ADForest
```

### Informations du Domaine

| Propriété | Valeur |
|-----------|--------|
| **Nom du domaine** | DC-300143951-00.local |
| **Nom NetBIOS** | DC-300143951-00 |
| **DNS Root** | DC-300143951-00.local |
| **Mode du domaine** | Windows2016Domain |
| **SID du domaine** | S-1-5-21-447135690-91861430-3213525697 |
| **Forêt** | DC-300143951-00.local |

### Rôles FSMO (Flexible Single Master Operations)

| Rôle | Serveur |
|------|---------|
| **PDC Emulator** | DC-300143951.DC-300143951-00.local |
| **RID Master** | DC-300143951.DC-300143951-00.local |
| **Infrastructure Master** | DC-300143951.DC-300143951-00.local |
| **Domain Naming Master** | DC-300143951.DC-300143951-00.local |
| **Schema Master** | DC-300143951.DC-300143951-00.local |

> ℹ️ Tous les rôles FSMO sont hébergés sur le même contrôleur de domaine (configuration typique pour un domaine à contrôleur unique).

---

## 🌲 Configuration de la Forêt

### Informations de la Forêt

| Propriété | Valeur |
|-----------|--------|
| **Nom de la forêt** | DC-300143951-00.local |
| **Mode de la forêt** | Windows2016Forest |
| **Domaine racine** | DC-300143951-00.local |
| **Catalogue global** | DC-300143951.DC-300143951-00.local |

### Partitions d'Application
- `DC=DomainDnsZones,DC=DC-300143951-00,DC=local`
- `DC=ForestDnsZones,DC=DC-300143951-00,DC=local`

### Sites Active Directory
- **Default-First-Site-Name** (site par défaut)

---

## 📁 Conteneurs Principaux

### Conteneurs Système

```
CN=Computers,DC=DC-300143951-00,DC=local          # Ordinateurs
CN=Users,DC=DC-300143951-00,DC=local              # Utilisateurs
CN=System,DC=DC-300143951-00,DC=local             # Système
OU=Domain Controllers,DC=DC-300143951-00,DC=local # Contrôleurs de domaine
CN=ForeignSecurityPrincipals,DC=DC-300143951-00,DC=local # Principaux de sécurité étrangers
CN=LostAndFound,DC=DC-300143951-00,DC=local       # Objets perdus
CN=Deleted Objects,DC=DC-300143951-00,DC=local    # Objets supprimés
CN=NTDS Quotas,DC=DC-300143951-00,DC=local        # Quotas NTDS
```

---

## 🔧 Commandes PowerShell Utiles

### Gestion des Utilisateurs

```powershell
# Lister tous les utilisateurs
Get-ADUser -Filter * | Select-Object Name, SamAccountName, Enabled

# Créer un nouvel utilisateur
New-ADUser -Name "Prénom Nom" -SamAccountName "pnom" -UserPrincipalName "pnom@DC-300143951-00.local" -Path "CN=Users,DC=DC-300143951-00,DC=local" -AccountPassword (ConvertTo-SecureString "MotDePasse123!" -AsPlainText -Force) -Enabled $true

# Modifier un utilisateur
Set-ADUser -Identity "pnom" -Description "Description de l'utilisateur"
```

### Gestion des Groupes

```powershell
# Lister tous les groupes
Get-ADGroup -Filter * | Select-Object Name, GroupScope, GroupCategory

# Créer un nouveau groupe
New-ADGroup -Name "MonGroupe" -GroupScope Global -GroupCategory Security -Path "CN=Users,DC=DC-300143951-00,DC=local"

# Ajouter un utilisateur à un groupe
Add-ADGroupMember -Identity "MonGroupe" -Members "pnom"
```

### Gestion des Ordinateurs

```powershell
# Lister tous les ordinateurs
Get-ADComputer -Filter * | Select-Object Name, DNSHostName, Enabled

# Ajouter un ordinateur au domaine (depuis l'ordinateur client)
Add-Computer -DomainName "DC-300143951-00.local" -Credential (Get-Credential) -Restart
```

### Diagnostic et Maintenance

```powershell
# Vérifier la réplication AD
repadmin /replsummary

# Tester les services AD
dcdiag /v

# Vérifier les rôles FSMO
netdom query fsmo

# Vérifier la santé du contrôleur de domaine
Get-ADDomainController -Filter * | Select-Object Name, OperatingSystem, IPv4Address
```

---

## 🔐 Stratégies de Groupe (GPO)

### GPO Liées au Domaine

```powershell
# Lister les GPO
Get-GPO -All | Select-Object DisplayName, GPOStatus, CreationTime

# Créer une nouvelle GPO
New-GPO -Name "Ma Politique" -Comment "Description de la politique"

# Lier une GPO au domaine
New-GPLink -Name "Ma Politique" -Target "DC=DC-300143951-00,DC=local"
```

### GPO par Défaut
- `{31B2F340-016D-11D2-945F-00C04FB984F9}` - Default Domain Policy

---

## 🌐 Configuration DNS

```powershell
# Vérifier les zones DNS
Get-DnsServerZone

# Vérifier les enregistrements DNS du domaine
Get-DnsServerResourceRecord -ZoneName "DC-300143951-00.local"
```

---

## 🔒 Sécurité et Bonnes Pratiques

### Recommandations

✅ **Sauvegardes régulières** de l'état du système AD  
✅ **Surveillance des événements** dans l'observateur d'événements  
✅ **Mise à jour** régulière du contrôleur de domaine  
✅ **Politique de mots de passe** forte  
✅ **Audits de sécurité** périodiques  

### Commandes de Sécurité

```powershell
# Obtenir la politique de mot de passe
Get-ADDefaultDomainPasswordPolicy

# Lister les administrateurs du domaine
Get-ADGroupMember -Identity "Domain Admins"

# Vérifier les connexions récentes
Get-ADUser -Filter * -Properties LastLogonDate | Select-Object Name, LastLogonDate | Sort-Object LastLogonDate -Descending
```

---

## 📊 Monitoring et Rapports

### Génération de Rapports

```powershell
# Rapport des utilisateurs inactifs (>90 jours)
$Date = (Get-Date).AddDays(-90)
Get-ADUser -Filter {LastLogonDate -lt $Date -and Enabled -eq $true} -Properties LastLogonDate | 
    Select-Object Name, SamAccountName, LastLogonDate

# Rapport des ordinateurs inactifs
Get-ADComputer -Filter {LastLogonDate -lt $Date} -Properties LastLogonDate | 
    Select-Object Name, LastLogonDate
```

---

## 🆘 Dépannage

### Problèmes Courants

**Problème :** Impossible de joindre le domaine  
**Solution :** Vérifier la connectivité DNS et s'assurer que le serveur DNS pointe vers le contrôleur de domaine

```powershell
# Vérifier la connectivité
Test-Connection -ComputerName DC-300143951.DC-300143951-00.local
nslookup DC-300143951-00.local
```

**Problème :** Réplication AD échoue  
**Solution :** Vérifier les services de réplication

```powershell
# Forcer la réplication
repadmin /syncall /AdeP
```

---

## 📚 Ressources Supplémentaires

- [Documentation Microsoft Active Directory](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview)
- [Cmdlets PowerShell Active Directory](https://docs.microsoft.com/en-us/powershell/module/activedirectory/)
- [Guide des rôles FSMO](https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/fsmo-roles)

---

## 📝 Notes Importantes

⚠️ **Attention :** Cette machine virtuelle est configurée en mode lab/test  
⚠️ **Sauvegardez** régulièrement l'état de votre VM  
⚠️ **Ne pas exposer** ce contrôleur de domaine sur Internet sans sécurisation appropriée

---

**Copyright © Microsoft Corporation. All rights reserved.**

Dernière mise à jour : Octobre 2025
