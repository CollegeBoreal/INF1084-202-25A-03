cd "C:\Users\Administrator.DC300150416\Developer\INF1084-202-25A-03\4.OUs\300150416"

@"

💻 TP - Gestion complète Active Directory avec PowerShell
👨‍🎓 Étudiant
Nom : Souyadi Hachem
ID Boréal : 300150416
Cours : INF1084 – Systèmes d’exploitation
Collège : Collège Boréal
Session : Automne 2025

🎯 Objectif du TP
Ce TP a pour but de configurer un domaine Active Directory complet sous Windows Server et de gérer ses utilisateurs via PowerShell.
L’étudiant apprend à :

Installer et configurer ADDS (Active Directory Domain Services)
Créer un domaine unique basé sur son identifiant
Créer, modifier et exporter des utilisateurs du domaine
Travailler avec PowerShell + GitHub pour automatiser et documenter le projet
⚙️ Environnement utilisé
Windows Server 2022
Module PowerShell : ActiveDirectory
Outils : Visual Studio Code / PowerShell ISE
Git & GitHub pour le suivi et la remise
🏗️ Partie 1 : Configuration du serveur
🔹 Renommer le serveur
```powershell Rename-Computer -NewName "DC300150416" -Restart ```

🧩 Partie 2 : Installation du rôle ADDS
```powershell Install-WindowsFeature AD-Domain-Services -IncludeManagementTools ``` Résultat attendu : ``` Success : True
Exit Code : Success
Feature Result : {Active Directory Domain Services, Group Policy Management} ```

🌐 Partie 3 : Création du domaine
```powershell Install-ADDSForest -DomainName "DC300150416-00.local" -DomainNetbiosName "DC300150416-00" -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force)  -Force \``

🧠 Ce script crée un domaine complet, installe DNS et configure le mot de passe DSRM.

👥 Partie 4 : Gestion des utilisateurs AD
📦 Importer le module Active Directory
```powershell Import-Module ActiveDirectory ```

🔎 Vérifier le domaine et le contrôleur
```powershell Get-ADDomain Get-ADDomainController -Filter * ```

👤 Créer un utilisateur
```powershell New-ADUser -Name "Alice Dupont" -GivenName "Alice" -Surname "Dupont" -SamAccountName "alice.dupont" -UserPrincipalName "alice.dupont@DC300150416-00.local" -AccountPassword (ConvertTo-SecureString "Pa$$w0rd2025!" -AsPlainText -Force) -Enabled $true  -Path "OU=Students,DC=DC300150416-00,DC=local" \``

✉️ Modifier ses informations
```powershell Set-ADUser -Identity "alice.dupont" -EmailAddress "alice.dupont@collegeboreal.ca" ```

🔐 Désactiver / Réactiver un compte
```powershell Disable-ADAccount -Identity "alice.dupont" Enable-ADAccount -Identity "alice.dupont" ```

🗑️ Supprimer un utilisateur
```powershell Remove-ADUser -Identity "alice.dupont" -Confirm:$false ```

🧮 Partie 5 : Exportation des utilisateurs
📤 Export vers CSV
```powershell Get-ADUser -Filter * -Server "DC300150416-00.local" -Properties Name, SamAccountName, EmailAddress, Enabled | Where-Object { $_.SamAccountName -notin @("Administrator","Guest","krbtgt") } | Select-Object Name, SamAccountName, EmailAddress, Enabled | Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8 ```

Résultat du fichier :

Name	SamAccountName	Email	Enabled
Alice Dupont	alice.dupont	alice.dupont@collegeboreal.ca	True
📂 Structure du projet
``` INF1084-202-25A-03/ └── 4.OUs/ └── 300150416/ ├── README.md ├── TP_AD_Users.csv └── images/ └── .gitkeep ```

🚀 Commandes Git utilisées
```bash git add 300150416 git commit -m "TP Active Directory complet - 300150416" git push ```

✅ Résumé du TP
Étape	Description	Statut
Renommage du serveur	`Rename-Computer`	✅
Installation ADDS	`Install-WindowsFeature`	✅
Création du domaine	`Install-ADDSForest`	✅
Création d’un utilisateur	`New-ADUser`	✅
Export CSV	`Export-Csv`	✅
GitHub push	`git push`	✅
🏁 Conclusion
Grâce à ce TP, j’ai appris à :

Configurer un contrôleur de domaine Windows Server
Gérer les utilisateurs avec PowerShell et Active Directory
Automatiser les exports et organiser les OU
Versionner mon travail avec Git et GitHub
Fait avec 💙 par Hachem Souyadi "@ | Out-File -FilePath README.md -Encoding UTF8

git add README.md git commit -m "README complet et formaté" git push
