# Définir le chemin du dossier partagé
$SharedFolder = "C:\SharedResources"

# Créer le dossier s’il n’existe pas déjà
New-Item -Path $SharedFolder -ItemType Directory -Force

# Définir le nom du groupe Active Directory pour les étudiants
$GroupName = "Students"

# Créer le groupe AD pour les utilisateurs autorisés à accéder au partage et au RDP
New-ADGroup -Name $GroupName -GroupScope Global -Description "Users allowed RDP and shared folder access"

# Créer les comptes utilisateurs AD et les ajouter au groupe défini
$Users = @("Etudiant1","Etudiant2")
foreach ($user in $Users) {
    New-ADUser -Name $user -SamAccountName $user -AccountPassword (ConvertTo-SecureString "Pass123!" -AsPlainText -Force) -Enabled $true
    Add-ADGroupMember -Identity $GroupName -Members $user
}

# Créer un partage SMB sur le dossier et accorder un accès complet au groupe Students
New-SmbShare -Name "SharedResources" -Path $SharedFolder -FullAccess $GroupName

