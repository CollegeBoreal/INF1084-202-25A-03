# Arrêter le service DFSR
Stop-Service -Name DFSR

# Vérifier son statut
(Get-Service -Name DFSR).status

# Redémarrer le service DFSR
Start-Service -Name DFSR
