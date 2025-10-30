---

## ✅ Correction

Il suffit de mettre l’IP entre **guillemets** pour en faire une chaîne :

```powershell
$remoteComputer = "10.7.236.224"
```

Ensuite ton `Invoke-Command` fonctionne :

```powershell
$cred = Get-Credential

Invoke-Command -ComputerName $remoteComputer -Credential $cred -ScriptBlock {
    $userProfile = $env:USERPROFILE
    $path = Join-Path $userProfile 'Developer\INF1084-202-25A-03\4.OUs\300153476'
    Test-Path $path
}
```

* Retour attendu : `True` si le répertoire existe, `False` sinon.

