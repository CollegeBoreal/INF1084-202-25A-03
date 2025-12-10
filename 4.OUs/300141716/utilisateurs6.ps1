# 6. Réactiver un utilisateur
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== RÉACTIVATION D'UN UTILISATEUR ===" -ForegroundColor Yellow

Enable-ADAccount -Identity "test.user" -Credential $cred

Write-Host "✅ Utilisateur test.user réactivé" -ForegroundColor Green
