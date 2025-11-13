# Définir le nom de la GPO
$GPOName = "MapSharedFolder"

# Créer une nouvelle GPO
New-GPO -Name $GPOName

# Spécifier l’unité d’organisation (OU) cible pour le lien de la GPO (exemple : "Students")
$OU = "OU=Students,DC=$netbiosName,DC=local"
New-GPLink -Name $GPOName -Target $OU

# Définir la lettre du lecteur et le chemin du partage réseau à mapper
$DriveLetter = "Z:"
$SharePath = "\\$netbiosName\SharedResources"

# Créer le dossier pour les scripts de connexion si nécessaire
$ScriptFolder = "C:\Scripts"
$ScriptPath = "$ScriptFolder\MapDrive-$DriveLetter.bat"
if (-not (Test-Path $ScriptFolder)) { New-Item -ItemType Directory -Path $ScriptFolder }

# Générer le contenu du script de connexion pour mapper le lecteur réseau
$scriptContent = "net use $DriveLetter $SharePath /persistent:no"
Set-Content -Path $ScriptPath -Value $scriptContent

# Associer le script de connexion à la GPO créée
Set-GPRegistryValue -Name $GPOName `
                    -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
                    -ValueName "LogonScript" `
                    -Type String `
                    -Value $ScriptPath

