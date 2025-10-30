 🖥️ Leçon : Les services Windows et AD DS

## :zero: Introduction aux services Windows

Un **service Windows** est un programme qui s’exécute en arrière-plan pour fournir des fonctionnalités spécifiques au système ou aux applications.

* Ils **ne nécessitent pas d’interface graphique**.
* Ils peuvent **démarrer automatiquement au démarrage** ou **manuellement**.
* Les services assurent la **stabilité et la continuité** des fonctions essentielles de Windows.

**Exemples de services Windows :**

* `WinDefend` : Windows Defender
* `W32Time` : Service de temps Windows
* `Spooler` : Gestion de l’impression

---

## 1️⃣ Les Relations dans AD

Les principales abréviations et services d’Active Directory et leurs relations:

```mermaid
flowchart TB
    subgraph DC[Domain Controller - DC]
        NTDS[NTDS - AD DS]
        KDC[KDC - Kerberos]
        Netlogon[Netlogon]
        ADWS[AD Web Services]
        DFSR[DFSR - Réplication SYSVOL]
        IsmServ[ISM / IsmServ - Réplication inter-sites]
        SYSVOL[SYSVOL]
    end

    subgraph AD[Active Directory]
        OU[OU - Organizational Unit]
        GPO[GPO - Group Policy Object]
        LDAP[LDAP - Lightweight Directory Access Protocol]
        FSMO[FSMO - Flexible Single Master Operations]
    end

    %% Relations
    DC --> AD
    NTDS --> SYSVOL
    NTDS --> GPO
    DFSR --> SYSVOL
    IsmServ --> SYSVOL
    KDC --> NTDS
    Netlogon --> NTDS
    ADWS --> NTDS
    OU --> GPO
    LDAP --> NTDS
    FSMO --> NTDS

    %% Styles
    style DC fill:#ffe4b5,stroke:#f08080,stroke-width:2px
    style AD fill:#add8e6,stroke:#1e90ff,stroke-width:2px
    style NTDS fill:#fff0f5,stroke:#ff69b4,stroke-width:1px
    style KDC fill:#e0ffff,stroke:#00ced1,stroke-width:1px
    style Netlogon fill:#98fb98,stroke:#008000,stroke-width:1px
    style ADWS fill:#dda0dd,stroke:#9400d3,stroke-width:1px
    style DFSR fill:#f0e68c,stroke:#bdb76b,stroke-width:1px
    style IsmServ fill:#fafad2,stroke:#daa520,stroke-width:1px
    style SYSVOL fill:#fffacd,stroke:#ff8c00,stroke-width:1px
    style GPO fill:#ffebcd,stroke:#ff8c00,stroke-width:1px
    style OU fill:#e6e6fa,stroke:#9370db,stroke-width:1px
    style LDAP fill:#f5f5dc,stroke:#8b4513,stroke-width:1px
    style FSMO fill:#ffe4e1,stroke:#ff4500,stroke-width:1px
```

---

### 💡 Explications du schéma

* **DC** contient tous les services critiques : NTDS, KDC, Netlogon, DFSR, ADWS, ISM.
* **NTDS** est le cœur d’AD DS, lié à SYSVOL et aux GPO.
* **DFS et ISM** assurent la réplication des dossiers et des politiques.
* **OU, GPO, LDAP, FSMO** représentent les concepts et objets AD utilisés par les services.
* Les flèches indiquent les dépendances et interactions entre services et concepts.

## 2️⃣ Les services liés à Active Directory

Active Directory (AD) est une **infrastructure de gestion centralisée** des utilisateurs, ordinateurs et ressources réseau.
Les services AD dépendent de plusieurs **services Windows critiques**.

### 2.1 Liste des services AD importants

| Service                                 | Nom du service | Rôle / Description                                                                              |
| --------------------------------------- | -------------- | ----------------------------------------------------------------------------------------------- |
| **Active Directory Domain Services**    | `NTDS`         | Base de données AD, gestion des objets (utilisateurs, groupes, ordinateurs) et GPO.             |
| **Active Directory Web Services**       | `ADWS`         | Permet aux outils de gestion AD (PowerShell, ADUC) de se connecter à distance via web services. |
| **Distributed File System Replication** | `DFSR`         | Réplique les dossiers SYSVOL entre DC pour la cohérence des scripts et GPO.                     |
| **Kerberos Key Distribution Center**    | `kdc`          | Fournit les tickets Kerberos pour l’authentification des utilisateurs et ordinateurs.           |
| **Netlogon**                            | `Netlogon`     | Authentification des utilisateurs, localisation des DC et enregistrement des services dans AD.  |
| **Intersite Messaging Service**         | `IsmServ`      | Assure la réplication des données AD entre différents sites.  
