# --------------------------------------
# Script pour tester les partages SMB étudiants avec montage temporaire
# --------------------------------------

# Forcer UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$PSDefaultParameterValues['Set-Content:Encoding'] = 'utf8'

# Charger la liste des étudiants et serveurs depuis students.ps1
. ../.scripts/students.ps1

if (-not $SERVERS -or -not $ETUDIANTS) {
    Write-Host "Les variables `$SERVERS ou `$ETUDIANTS n'ont pas été trouvées dans students.ps1" -ForegroundColor Red
    exit
}

# Préparer le Markdown
$timestamp = Get-Date -Format "dd-MM-yyyy HH:mm"
$md = @()
$md += "# Verification au $timestamp"
$md += ""
$md += "| Table des matières            | Description                                             |"
$md += "|-------------------------------|---------------------------------------------------------|"
$md += "| :a: [Presence](#a-presence)   | L'étudiant.e a accès à son partage SMB :heavy_check_mark: |"
$md += "| :b: [Precision](#b-precision) | Statut du partage SMB                                   |"
$md += ""
$md += "## :b: Precision"
$md += ""
$md += "| # | Etudiant | VM/Serveur | Partage SMB | Statut |"
$md += "|---|----------|------------|------------|--------|"

# Boucle sur chaque étudiant
$counter = 1
for ($i = 0; $i -lt $ETUDIANTS.Count; $i++) {

    $etudiant = "Etudiant1"
    $vm = $SERVERS[$i]

    # Identifiants de l'étudiant
    $plainPassword = "Pass123!"  # changer si chaque étudiant a un mot de passe différent
    $Password = ConvertTo-SecureString $plainPassword -AsPlainText -Force
    $Creds = New-Object System.Management.Automation.PSCredential ($etudiant, $Password)

    # Chemin SMB et lecteur temporaire
    $sharePath = "\\$vm\SharedResources"
    $driveName = "S"  # Lettre temporaire, peut être dynamique si besoin

    Write-Host "Test SMB pour $etudiant sur $sharePath ..." -ForegroundColor Cyan

    try {
        # Monter le partage SMB temporairement
        New-PSDrive -Name $driveName -PSProvider FileSystem -Root $sharePath -Credential $Creds -ErrorAction Stop | Out-Null

        # Vérifier l'accès correctement
        if (Test-Path "$($driveName):\") {
            $status = ":heavy_check_mark:"
        } else {
            $status = ":x:"
        }

        # Démonter le lecteur
        Remove-PSDrive -Name $driveName
    }
    catch {
        Write-Host "Erreur SMB pour $etudiant sur $vm : $($_.Exception.Message)" -ForegroundColor Red
        $status = ":no_entry:"
    }

    # Ajouter la ligne au Markdown
    $md += "| $counter | $etudiant | $vm | $sharePath | $status |"
    $counter++
}

# Exporter le Markdown dans Verification.md
$md | Set-Content -Path ".scripts/Verification.md" -Encoding UTF8
Write-Host "Verification.md généré avec succès !" -ForegroundColor Green
