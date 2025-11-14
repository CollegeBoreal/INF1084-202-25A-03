cd "C:\Users\Administrator\Developer\INF1084-202-25A-03\4.OUs\300150195"

@"
💻 **TP - Gestion complète Active Directory avec PowerShell**

👩‍🎓 **Étudiante**  
Nom : Amel Zourane  
ID Boréal : 300150195  
Cours : INF1084 – Systèmes d’exploitation  
Collège : Collège Boréal  
Session : Automne 2025  

---

## 🎯 Objectif du TP

Ce TP permet de :

- Installer ADDS (Active Directory Domain Services)
- Créer un domaine basé sur l’ID Boréal
- Gérer les utilisateurs via PowerShell
- Exporter les utilisateurs dans un fichier CSV
- Utiliser Git & GitHub pour la remise du travail

---

## ⚙️ Environnement utilisé

- Windows Server 2022  
- PowerShell 5.1  
- Module ActiveDirectory  
- Visual Studio Code  
- Git + GitHub  

---

# 🏗️ Partie 1 : Renommage du serveur

\`\`\`powershell
Rename-Computer -NewName "DC300150195" -Restart
\`\`\`

---

# 🧩 Partie 2 : Installation du rôle ADDS

\`\`\`powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
\`\`\`

---

# 🌐 Partie 3 : Création du domaine

\`\`\`powershell
Install-ADDSForest -DomainName "DC300150195-00.local" -DomainNetbiosName "DC300150195" -InstallDns:\$true -SafeModeAdministratorPassword (ConvertTo-SecureString "Pa$$word123!" -AsPlainText -Force) -Force
\`\`\`

---

# 👥 Partie 4 : Gestion des utilisateurs AD

### ✅ Charger le module

\`\`\`powershell
Import-Module ActiveDirectory
\`\`\`

### ✅ Vérifier le domaine

\`\`\`powershell
Get-ADDomain
Get-ADDomainController -Filter *
\`\`\`

### ✅ Créer un utilisateur

\`\`\`powershell
New-ADUser -Name "Alice Dupont" -GivenName "Alice" -Surname "Dupont" -SamAccountName "alice.dupont" -UserPrincipalName "alice.dupont@DC300150195-00.local" -AccountPassword (ConvertTo-SecureString "Pa$$w0rd2025!" -AsPlainText -Force) -Enabled \$true -Path "OU=Students,DC=DC300150195-00,DC=local"
\`\`\`

### ✅ Modifier un utilisateur

\`\`\`powershell
Set-ADUser -Identity "alice.dupont" -EmailAddress "alice.dupont@collegeboreal.ca"
\`\`\`

### ✅ Désactiver / Activer

\`\`\`powershell
Disable-ADAccount -Identity "alice.dupont"
Enable-ADAccount -Identity "alice.dupont"
\`\`\`

### ✅ Supprimer

\`\`\`powershell
Remove-ADUser -Identity "alice.dupont" -Confirm:\$false
\`\`\`

---

# 🧮 Partie 5 : Export CSV

\`\`\`powershell
Get-ADUser -Filter * -Properties Name,SamAccountName,EmailAddress,Enabled |
Where-Object { \$_.SamAccountName -notin @("Administrator","Guest","krbtgt") } |
Select-Object Name,SamAccountName,EmailAddress,Enabled |
Export-Csv -Path "TP_AD_Users.csv" -NoTypeInformation -Encoding UTF8
\`\`\`

---

# 📂 Structure du projet

\`\`\`
INF1084-202-25A-03/
└── 4.OUs/
    └── 300150195/
        ├── README.md
        ├── TP_AD_Users.csv
        └── images/
            └── .gitkeep
\`\`\`

---

# 🚀 Commandes Git utilisées

\`\`\`bash
git add 300150195
git commit -m "TP Active Directory complet - 300150195"
git push
\`\`\`

---

# ✅ Conclusion

Dans ce TP, j’ai appris à :

- Configurer un contrôleur de domaine Windows Server  
- Installer ADDS et créer un domaine unique  
- Gérer les utilisateurs via PowerShell  
- Exporter un CSV  
- Documenter le projet avec GitHub  

**Fait avec 💙 par Amel Zourane**
"@ | Out-File -FilePath README.md -Encoding UTF8
