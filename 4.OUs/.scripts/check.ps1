# --------------------------------------
# Script check.ps1 modifié pour tester l'existence des répertoires
# --------------------------------------

# Charger la liste des VMs depuis students.ps1
. ../../../.scripts/students.ps1 # le point suivi d'espace permet d'importer les variables

if (-not $SERVERS) {
    Write-Host "La variable `$SERVERS n'a pas été trouvée dans students.ps1" -ForegroundColor Red
    exit
}

# Identifiants administrateur
$User = "Administrator"
$Password = Read-Host -AsSecureString "Mot de passe de $User"

# Préparer Markdown
$timestamp = Get-Date -Format "dd-MM-yyyy HH:mm"
$md = @()
$md += "# Vérification des répertoires étudiants - $timestamp"
$md += ""
$md += "| # | Étudiant | VM | Présence du répertoire |"
$md += "|---|----------|----|----------------------|"

$counter = 1

foreach ($VM in $SERVERS) {
    Write-Host "Connexion à $VM ..." -ForegroundColor Cyan
    try {
        $Session = New-PSSession -ComputerName $VM -Credential (New-Object PSCredential ($User, $Password))
        
        foreach ($id in $STUDENT_IDS) {
            # Construire le chemin du répertoire à tester via USERPROFILE
            $exists = Invoke-Command -Session $Session -ScriptBlock {
                param($studentID)
                $userProfile = $env:USERPROFILE
                $path = Join-Path $userProfile "Developer\INF1084-202-25A-03\4.OUs\$studentID"
                Test-Path $path
            } -ArgumentList $id

            # Choix de l'icône Markdown
            $statusIcon = if ($exists) { ":heavy_check_mark:" } else { ":x:" }

            # Ajouter la ligne Markdown
            $md += "| $counter | $id | $VM | $statusIcon |"
            $counter++
        }

        Remove-PSSession $Session
    }
    catch {
        Write-Host "Échec de connexion à $VM : $($_.Exception.Message)" -ForegroundColor Red
        foreach ($id in $STUDENT_IDS) {
            $md += "| $counter | $id | $VM | :no_entry: |"
            $counter++
        }
    }
}

# Exporter le README.md
$md | Set-Content -Path ".scripts/Check.md" -Encoding UTF8
Write-Host "README.md généré avec succès !" -ForegroundColor Green

