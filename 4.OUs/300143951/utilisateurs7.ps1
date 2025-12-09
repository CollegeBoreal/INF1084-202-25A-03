try {
    Remove-ADUser -Identity "alice.dupont" -Confirm:$false -Credential $cred
    Write-Host "Utilisateur supprimé avec succès !" -ForegroundColor Green
}
catch {
    Write-Host "Erreur lors de la suppression : $($_.Exception.Message)" -ForegroundColor Red
}

