# **Création simplifiée d’un trust AD avec netdom – étape par étape**

---

## **1️⃣ Vérifier que `netdom` est disponible**

```powershell
# Vérifie que netdom est installé
if (-not (Get-Command netdom -ErrorAction SilentlyContinue)) {
    Write-Error "netdom introuvable. Installe RSAT ou exécute sur un DC."
    exit 1
}
```

💡 **Explication** : `netdom` est l’outil officiel pour créer un trust. Il doit être présent sur la machine (RSAT ou DC).

---

## **2️⃣ Demander les informations d’identification pour chaque domaine**

```powershell
# Identifiants administrateur pour le domaine source
$credSource = Get-Credential -Message "Admin du domaine source (SourceDomain)"

# Identifiants administrateur pour le domaine cible
$credTarget = Get-Credential -Message "Admin du domaine cible (TargetDomain)"
```

💡 **Explication** : On a besoin des comptes admin pour pouvoir créer le trust sur **les deux domaines**.

---

## **3️⃣ Demander le mot de passe du trust**

```powershell
# Mot de passe sécurisé pour le trust
$secureTrustPwd = Read-Host "Mot de passe du trust" -AsSecureString

# Convertir SecureString en texte clair
$ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureTrustPwd)
$trustPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)

# Libérer la mémoire
[Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
```

💡 **Explication** : `netdom` nécessite un mot de passe pour le trust. On utilise un `SecureString` pour sécuriser la saisie.

---

## **4️⃣ Construire la commande `netdom` pour créer le trust**


Pour passer des **IP des VM → FQDN du domaine** et préparer le trust :

```powershell
# Exemple : IP des DC
$SourceIP = "10.7.236.149"  # (get-ADDomain).DNSRoot => DC300098957-40.local
$TargetIP = "10.7.236.170"  # (get-ADDomain).DNSRoot => DC300098957-90.local

# Récupérer le nom de machine / FQDN
$SourceHost = [System.Net.Dns]::GetHostEntry($SourceIP).HostName
$TargetHost = [System.Net.Dns]::GetHostEntry($TargetIP).HostName

# Depuis chaque DC, récupérer le FQDN du domaine AD
$SourceDomain = Invoke-Command -ComputerName $SourceHost -ScriptBlock { (Get-ADDomain).DNSRoot }
# $TargetDomain = Invoke-Command -ComputerName $TargetHost -ScriptBlock { (Get-ADDomain).DNSRoot }
$TargetDomain = "DC300098957-90.local"

# Afficher résultats
Write-Host "SourceDomain: $SourceDomain"
Write-Host "TargetDomain: $TargetDomain"
```

✅ **Explications condensées :**

1. `GetHostEntry(IP)` → obtient le nom de la machine.
2. `Invoke-Command` sur le DC → récupère le **FQDN exact du domaine AD**.
3. Utilise `$SourceDomain` et `$TargetDomain` dans ton script `netdom`.

---

```powershell
# Exemple : trust bidirectionnel
$Direction = "TwoWay"  # ou "OneWay"

# Déterminer la direction correctement
$directionArg = if ($Direction -eq "TwoWay") { "/TWOWAY" } else { "/ONEDIRECTION" }

# Construire les arguments netdom
$argList = @(
    "trust", $SourceDomain,
    "/Domain:$TargetDomain",
    "/UserO:$($credSource.UserName)",
    "/PasswordO:$($credSource.GetNetworkCredential().Password)",
    "/UserD:$($credTarget.UserName)",
    "/PasswordD:$($credTarget.GetNetworkCredential().Password)",
    "/Add",
    $directionArg,
    "/PasswordT:$trustPassword"
)
```

💡 **Explication** :

* `UserO` / `PasswordO` : compte admin du domaine **source**
* `UserD` / `PasswordD` : compte admin du domaine **cible**
* `/Add` : création du trust
* `/TwoWay` ou `/OneWay` : type du trust
* `/PasswordT` : mot de passe partagé
* `/Verify` : vérifie immédiatement après la création

---

## **5️⃣ Exécuter `netdom` pour créer le trust**

```powershell
Write-Host "Création du trust..."
$proc = Start-Process -FilePath "netdom" -ArgumentList $argList -NoNewWindow -Wait -PassThru

if ($proc.ExitCode -eq 0) {
    Write-Host "Trust créé avec succès !"
} else {
    Write-Error "Erreur netdom (code $($proc.ExitCode))"
}
```

💡 **Explication** : `Start-Process` lance la commande `netdom` avec les arguments que l’on a construits.

* `ExitCode 0` = succès

---

## **6️⃣ Vérification du trust**

```powershell
Write-Host "Vérification du trust..."
$verifyProc = Start-Process -FilePath "netdom" -ArgumentList @("trust",$SourceDomain,"/domain:$TargetDomain","/Verify") -NoNewWindow -Wait -PassThru

if ($verifyProc.ExitCode -eq 0) {
    Write-Host "Vérification OK."
} else {
    Write-Warning "Vérification échouée (code $($verifyProc.ExitCode))"
}
```

💡 **Explication** : Cette étape permet de s’assurer que le trust a été créé correctement et que les domaines peuvent communiquer.

---

## ✅ **7️⃣ Résultat final**

Après ces étapes, ton trust AD entre `source.local` et `target.local` est créé et vérifié.

---

### **Utilisation complète pour un étudiant**

```powershell
# Définir les domaines
$SourceDomain = "source.local"
$TargetDomain = "target.local"
$Direction = "TwoWay"

# Étapes 1 à 6 : copier-coller les instructions ci-dessus dans l’ordre
```

> Chaque bloc peut être copié-collé séparément dans PowerShell pour tester étape par étape.

---

Si tu veux, je peux te faire **une version “une seule ligne” prête à copier-coller**, où l’étudiant n’a besoin que de changer **SourceDomain, TargetDomain et Direction**, et tout est exécuté en une fois.

Veux‑tu que je fasse ça ?
