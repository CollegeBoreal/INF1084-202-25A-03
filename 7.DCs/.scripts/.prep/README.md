Parfait ! Voici un exemple de script PowerShell combinant **Carbon** pour la préparation AD et **`New-ADTrust`** pour créer le trust. Ce script suppose que tu as déjà le module **ActiveDirectory** et Carbon installés.

```powershell
# -------------------------------
# Script : Création d'un trust AD avec Carbon
# -------------------------------

# Charger Carbon
Import-Module Carbon

# Paramètres des domaines
$SourceDomain = "source.local"
$TargetDomain = "target.local"
$TrustType = "External"      # Peut être External ou Forest
$Direction = "Bidirectional" # OneWayIncoming, OneWayOutgoing, Bidirectional

# -------------------------------
# 1. Vérifier que les domaines existent
# -------------------------------
if (-not (Test-ADDomain $SourceDomain)) {
    Write-Host "Le domaine source n'existe pas ou n'est pas accessible."
    exit
}
if (-not (Test-ADDomain $TargetDomain)) {
    Write-Host "Le domaine cible n'existe pas ou n'est pas accessible."
    exit
}

# -------------------------------
# 2. Préparer les OU ou groupes nécessaires avec Carbon (facultatif)
# -------------------------------
# Exemple : créer un groupe pour le trust dans le domaine source
$GroupName = "TrustAdmins"
if (-not (Get-ADGroup -Filter "Name -eq '$GroupName'" -Server $SourceDomain)) {
    New-ADGroup -Name $GroupName -GroupScope Global -Path "CN=Users,DC=source,DC=local" -Server $SourceDomain
    Write-Host "Groupe $GroupName créé dans $SourceDomain"
}

# -------------------------------
# 3. Créer le trust
# -------------------------------
# Nécessite d'avoir des droits d'admin sur les deux domaines
try {
    New-ADTrust -Name $TargetDomain `
                -SourceForest $SourceDomain `
                -TargetForest $TargetDomain `
                -TrustType $TrustType `
                -Direction $Direction `
                -Confirm:$false
    Write-Host "Trust créé avec succès entre $SourceDomain et $TargetDomain"
} catch {
    Write-Host "Erreur lors de la création du trust : $_"
}
```

### Points clés :

1. **Test-ADDomain** : cmdlet Carbon pour vérifier que le domaine est joignable.
2. **New-ADGroup** : Carbon/AD standard pour créer des objets nécessaires.
3. **New-ADTrust** : cmdlet native pour créer le trust réel.
4. **Privilèges** : tu dois être admin sur **les deux domaines**.

---


