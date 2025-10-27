# Place-toi dans le dossier
Set-Location "C:\Users\Admin\Developer\INF1084-202-25A-03\2.Utilisateurs\300150416"

# Renomme TON fichier source en utilisateurs1.ps1
Rename-Item -Path ".\utilisateur.ps1" -NewName "utilisateurs1.ps1"

# Renomme aussi le script qui a une faute dans le nom (utilisateur2.ps1 -> utilisateurs2.ps1)
Rename-Item -Path ".\utilisateur2.ps1" -NewName "utilisateurs2.ps1"
