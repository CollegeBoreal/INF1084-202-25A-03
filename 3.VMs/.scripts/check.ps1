# --------------------------------------
# Script pour accéder aux AD DS des étudiants et générer README.md
# --------------------------------------

# Charger la liste des VMs depuis students.ps1
. ../../.scripts/students.ps1 # le point suivi d'espace permet d'importer les variables

# Vérifier que $SERVERS existe
if (-not $SERVERS) {
    Write-Host "La variable `$SERVERS n'a pas été trouvée dans students.ps1" -ForegroundColor Red
    exit
}

# Identifiants administrateur (local ou domaine)
$User = "Administrator"
$Password = Read-Host -AsSecureString "Mot de passe de $User"

# Préparer le contenu Markdown
$timestamp = Get-Date -Format "dd-MM-yyyy HH:mm"
$md = @()
$md += "# Participation au $timestamp"
$md += ""
$md += "| Table des matières            | Description                                             |"
$md += "|-------------------------------|---------------------------------------------------------|"
$md += "| :a: [Présence](#a-prÃ©sence)   | L'étudiant.e a fait son travail    :heavy_check_mark:   |"
$md += "| :b: [Précision](#b-prÃ©cision) | L'étudiant.e a réussi son travail  :tada:               |"
$md += ""
$md += ":bulb: Le mot de passe Administrateur (en Anglais) de la VM est **Infra@2024**"
$md += ""
$md += "## Légende"
$md += ""
$md += "| Signe              | Signification                 |"
$md += "|--------------------|-------------------------------|"
$md += "| :heavy_check_mark: | AD DS a Ã©tÃ© installÃ©       |"
$md += "| :x:                | AD DS est inexistant          |"
$md += "| :no_entry:         | Accès refusÃ©                 |"
$md += ""
$md += "## :a: PrÃ©sence"
$md += ""
$md += "| :hash: | BorÃ©al :id: | VM       | :rocket: |"
$md += "|--------|-------------|----------|----------|"

# Boucle sur chaque VM
$i = 0
$s = 0
$counter = 1

foreach ($VM in $SERVERS) {
    
    $id = $ETUDIANTS[$i]
    $FILE = "$id/README.md"
    $server = $SERVERS[$i]

    Write-Host "Connexion à $VM ..." -ForegroundColor Cyan
    try {
        $Session = New-PSSession -ComputerName $VM -Credential (New-Object PSCredential ($User, $Password))
        
        # Vérifier le service AD DS (NTDS)
        $ADStatus = Invoke-Command -Session $Session -ScriptBlock {
            $svc = Get-Service -Name NTDS -ErrorAction SilentlyContinue
            if ($svc) { $svc.Status } else { -1 }
        }

        $statusIcon = if ($ADStatus -eq 4) { ":heavy_check_mark:"; $s++ } else { ":x:" }

        # Ajouter la ligne Markdown
        $md += "| $counter | [$id]($FILE) | $VM | $statusIcon |"

        # Fermer la session
        Remove-PSSession $Session
    }
    catch {
        Write-Host "Échec de connexion à $VM : $($_.Exception.Message)" -ForegroundColor Red
        $md += "| $counter | [$id]($FILE) | $VM | :no_entry: |"
    }
    $i++
    $counter++
    $COUNT = "\$\\frac{$s}{$i}$"
    $STATS = [math]::Round(($s * 100) / $i, 2)
    $SUM = "\$\displaystyle\sum_{i=1}^{$i} s_i$"
}

$md += "| :abacus: | $COUNT = $STATS% | | $SUM = $s |"

# Exporter le README.md
$md | Set-Content -Path "README.md" -Encoding UTF8
Write-Host "README.md généré avec succès !" -ForegroundColor Green

