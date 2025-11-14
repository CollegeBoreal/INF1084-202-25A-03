# WinRM


## Pour **Activer WinRM**

```powershell
Enable-PSRemoting -Force; Set-NetFirewallRule WINRM-HTTP-In-TCP-PUBLIC -RemoteAddress Any -Enabled True
```

* Active WinRM.
* Ouvre le firewall pour toutes les connexions.

Pour vérifier :

```powershell
(Get-Service WinRM).Status; (Get-NetFirewallRule WINRM-HTTP-In-TCP-PUBLIC).Enabled
```

* `Running` → WinRM actif
* `True` → firewall OK

## Pour **désactiver complètement WinRM**

```powershell
# Arrêter le service WinRM
Stop-Service WinRM -Force

# Désactiver le service pour qu'il ne se lance plus au démarrage
Set-Service WinRM -StartupType Disabled
```

Et pour le **firewall**, si tu veux revenir à l’état initial :

```powershell
Set-NetFirewallRule WINRM-HTTP-In-TCP-PUBLIC -Enabled False
```

💡 **Résumé ultra-minimal** (une ligne) pour tout enlever :

```powershell
Stop-Service WinRM -Force; Set-Service WinRM -StartupType Disabled; Set-NetFirewallRule WINRM-HTTP-In-TCP-PUBLIC -Enabled False
```

