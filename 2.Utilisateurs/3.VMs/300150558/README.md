<# =====================================================================
 TP AD DS - Script tout-en-un
 - Renomme le serveur
 - Installe AD DS
 - Crée la forêt et le domaine
 - Redémarre
 - À l’ouverture suivante, génère README.md avec les résultats réels
 Auteur : toi 🤝
===================================================================== #>

# ===================== PARAMÈTRES À AJUSTER AU BESOIN =====================
$ComputerName      = "DC300150558"                 # Nom du serveur (NetBIOS)
$DomainDnsName     = "DC300150558-00.local"        # Nom DNS du domaine
$DomainNetBIOS     = "DC300150558-00"              # Nom NetBIOS du domaine (<=15 chars)
$DSRMPasswordPlain = "MotDePasseDSRM123!"          # Mot de passe DSRM (lab)
$OutputDir         = "$env:USERPROFILE\Desktop\AD_Lab"     # Dossier du livrable
$ReadmePath        = Join-Path $OutputDir "README_AD_TP.md"
$PostScriptPath    = "C:\AD-PostInstall.ps1"       # Script de post-installation
$TaskName          = "AD-PostInstall-README"
# ==========================================================================

function Assert-Admin {
    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $p  = New-Object System.Security.Principal.WindowsPrincipal($id)
    if (-not $p.IsInRole([System.Security.Principal.WindowsBuiltinRole]::Administrator)) {
        Write-Error "Exécute ce script en tant qu'Administrateur."
        exit 1
    }
}
Assert-Admin

# Crée le dossier de sortie
New-Item -Path $OutputDir -ItemType Directory -Force | Out-Null

Write-Host "Étape 1/4 : Renommage du serveur en '$ComputerName' (si nécessaire)..." -ForegroundColor Cyan
try {
    if ($env:COMPUTERNAME -ne $ComputerName) {
        Rename-Computer -NewName $ComputerName -Force
        Write-Host "Renommage effectué. Un redémarrage suivra plus tard." -ForegroundColor Green
    } else {
        Write-Host "Le serveur porte déjà le nom souhaité." -ForegroundColor Yellow
    }
} catch {
    Write-Warning "Renommage ignoré : $($_.Exception.Message)"
}

Write-Host "Étape 2/4 : Installation du rôle AD DS..." -ForegroundColor Cyan
try {
    Install-WindowsFeature AD-Domain-Services -IncludeManagementTools | Out-Null
    Write-Host "Rôle AD DS installé." -ForegroundColor Green
} catch {
    Write-Error "Échec d'installation d'AD DS : $($_.Exception.Message)"
    exit 1
}

Write-Host "Préparation du script de post-installation..." -ForegroundColor Cyan

# Contenu du script post-redémarrage (génère README + résultats réels)
$PostScript = @"
# ================================================
# Script post-redémarrage : Génération README.md
# ================================================
param()

`$ErrorActionPreference = 'Stop'
Import-Module ActiveDirectory

# Attendre que le service AD soit prêt
for (`$i=1; `$i -le 30; `$i++) {
    try {
        # Un simple appel qui réussira quand ADWS sera prêt
        `$null = Get-ADDomain -ErrorAction Stop
        break
    } catch {
        Start-Sleep -Seconds 5
    }
}

# Récupération des infos réelles
`$domain  = Get-ADDomain
`$forest  = Get-ADForest
`$now     = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')

# Construction du README
`$ReadmeContent = @"
# 🖥️ TP — Installation et Configuration d’un Domaine Active Directory (Windows Server 2022)

_Généré automatiquement le : `$now_

## 📚 Table des matières
1. 🌐 Concepts AD  
2. 🧩 Objets AD  
3. 🏛️ Architecture  
4. 🔗 Trusts  
5. ⚙️ Installation AD DS (script)  
6. ✅ Vérification (résultats réels)

---

## 🌐 1) Concepts (rappel très bref)
- **Authentification** (Kerberos), **annuaire** (LDAP)
- **DNS** indispensable (enregistrements SRV)
- **GPO** pour la config et la sécurité

## 🧩 2) Objets AD
Utilisateurs, Groupes, Ordinateurs, Imprimantes, **OU** (organisation logique).

## 🏛️ 3) Architecture
**Forêt** → Domaines → **OU**  
**DC** = Contrôleur de domaine (héberge AD DS).  
**Catalogue global** = recherche globale.

## 🔗 4) Trusts
Transitives / Non-transitives, Uni- / Bidirectionnelles, Interforêt.

---

## ⚙️ 5) Installation — Commandes utilisées

\`\`\`powershell
# Renommage
Rename-Computer -NewName "$ComputerName" -Restart

# Rôle AD DS
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Création de la forêt + DNS
Install-ADDSForest `
    -DomainName "$DomainDnsName" `
    -DomainNetbiosName "$DomainNetBIOS" `
    -InstallDns:\$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "********" -AsPlainText -Force) `
    -Force
\`\`\`

> 💡 Compte après redémarrage : **$DomainNetBIOS\Administrator**

---

## ✅ 6) Vérification — Résultats réels

### 🔎 \`Get-ADDomain\`
\`\`\`
ComputersContainer
