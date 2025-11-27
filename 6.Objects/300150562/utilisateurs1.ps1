# utilisateurs1_corrige.ps1

# Chemin du dossier
$SharedFolder = "C:\SharedResources"

# Créer le dossier
New-Item -Path $SharedFolder -ItemType Directory -Force
Write-Host "Dossier créé : $SharedFolder" -ForegroundColor Green

# Créer un groupe LOCAL (pas AD)
$GroupName = "Students"

try {
    # Créer le groupe local
    New-LocalGroup -Name $GroupName -Description "Users allowed shared folder access"
    Write-Host "Groupe local créé : $GroupName" -ForegroundColor Green
}
catch {
    Write-Host "Le groupe $GroupName existe déjà" -ForegroundColor Yellow
}

# Créer des utilisateurs LOCAUX et les ajouter au groupe
$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    try {
        # Vérifier si l'utilisateur local existe
        $existingUser = Get-LocalUser -Name $user -ErrorAction SilentlyContinue
        if (-not $existingUser) {
            New-LocalUser -Name $user -Password (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) -AccountNeverExpires -PasswordNeverExpires
            Write-Host "Utilisateur local créé : $user" -ForegroundColor Green
        } else {
            Write-Host "Utilisateur existe déjà : $user" -ForegroundColor Yellow
        }
        
        # Ajouter au groupe local
        Add-LocalGroupMember -Group $GroupName -Member $user -ErrorAction SilentlyContinue
        Write-Host "Utilisateur $user ajouté au groupe $GroupName" -ForegroundColor Green
    }
    catch {
        Write-Host "Erreur avec l'utilisateur $user : $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Partager le dossier avec le groupe LOCAL
try {
    New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess "$env:COMPUTERNAME\$GroupName"
    Write-Host "Partage SMB créé : SharedResources" -ForegroundColor Green
}
catch {
    Write-Host "Erreur partage : $($_.Exception.Message)" -ForegroundColor Red
}

# Vérification finale
Write-Host "`n=== VÉRIFICATION ===" -ForegroundColor Cyan
Write-Host "Dossier partagé : \\$env:COMPUTERNAME\SharedResources" -ForegroundColor White
Write-Host "Groupe local : $GroupName" -ForegroundColor White

# Afficher les membres du groupe local
Get-LocalGroupMember -Group $GroupName | Format-Table Name, ObjectClass

# Tester l'accès au partage
Get-SmbShare -Name "SharedResources"