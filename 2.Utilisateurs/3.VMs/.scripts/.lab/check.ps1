# --------------------------------------
# Script pour accéder aux AD DS des étudiants
# --------------------------------------

# Charger la liste des VMs depuis students.ps1
. ../../../.scripts/students.ps1 # le point suivi d'espace permet d'importer les variables

# Vérifier que $SERVERS existe
if (-not $SERVERS) {
    Write-Host "La variable `$SERVERS n'a pas été trouvée dans students.ps1" -ForegroundColor Red
    exit
}

# Identifiants administrateur (local ou domaine)
$User = "Administrator"
$Password = Read-Host -AsSecureString "Mot de passe de $User"

# Préparer le rapport
$Report = @()

# Boucle sur chaque VM
foreach ($VM in $SERVERS) {
    Write-Host "Connexion à $VM ..." -ForegroundColor Cyan
    try {
        $Session = New-PSSession -ComputerName $VM -Credential (New-Object PSCredential ($User, $Password))
        
        # Vérifier le service AD DS (NTDS)
        $ADStatus = Invoke-Command -Session $Session -ScriptBlock {
            $svc = Get-Service -Name NTDS -ErrorAction SilentlyContinue
            if ($svc) { $svc.Status } else { "Non installé" }
        }

        # Ajouter au rapport
        $Report += [PSCustomObject]@{ VM = $VM; ADDS_Status = $ADStatus }

        # Fermer la session
        Remove-PSSession $Session
    }
    catch {
        Write-Host "Échec de connexion à $VM : $($_.Exception.Message)" -ForegroundColor Red
        $Report += [PSCustomObject]@{ VM = $VM; ADDS_Status = "Inaccessible" }
    }
}

# Exporter le rapport CSV
$Report | Export-Csv -Path "ADDS_Report.csv" -NoTypeInformation -Encoding UTF8
Write-Host "Rapport généré : ADDS_Report.csv" -ForegroundColor Green

