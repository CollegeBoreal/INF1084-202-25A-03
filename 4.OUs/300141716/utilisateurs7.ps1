# 7. Supprimer un utilisateur
. .\bootstrap.ps1
Import-Module ActiveDirectory

Write-Host "=== SUPPRESSION D'UN UTILISATEUR ===" -ForegroundColor Yellow

Remove-ADUser -Identity "test.user" -Confirm:$false -Credential $cred

Write-Host "✅ Utilisateur test.user supprimé" -ForegroundColor Green
