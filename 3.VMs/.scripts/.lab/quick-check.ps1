# Charger la liste des VMs depuis students.ps1
. ../../../.scripts/students.ps1 # le point suivi d'espace permet d'importer les variables

# Vérifier que $SERVERS existe
if (-not $SERVERS) {
    Write-Host "La variable `$SERVERS n'a pas été trouvée dans students.ps1" -ForegroundColor Red
    exit
}


 # 1) Autoriser les cibles (lab) □~@~T exécution en une ligne
 Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force

 # 2) Si psexec est dans ton PATH et que le compte admin est le même sur toutes les VMs :
 $cred = Get-Credential               # entre Administrator et son mot de passe
 $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($cred.Password)
 $plain = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
 [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)

 foreach ($vm in $SERVERS) {
     Write-Host "Enable-PSRemoting -> $vm"
         psexec \\$vm -u $cred.UserName -p $plain powershell -NoProfile -Command "Enable-PSRemoting -Force; Set-Service WinRM -StartupType Automatic; Start-Service WinRM"
         }

         # 3) Test rapide (exemple pour une VM)
         Test-WsMan -ComputerName 10.7.236.194
